import 'package:apod/api/apod_api.dart';
import 'package:apod/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'apod_theme.dart';
import 'features/home/home.dart';
import 'features/shared/blocs/apod/apod.dart';
import 'features/shared/models/models.dart';
import 'models/models.dart';

late Repository<Apod> apodRepository;
late Repository<JournalEntry> journalRepository;

void main() async {
  // This is required if we want to access platform channels.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive and a persistence wrapper
  await Hive.initFlutter();
  final apodHive = LocalPersistenceSource<Apod>(
    fromJson: (Map<String, dynamic> data) => Apod.fromJson(data),
    toJson: (Apod obj) => obj.toJson(),
  );
  final journalHive = LocalPersistenceSource<JournalEntry>(
    fromJson: (Map<String, dynamic> data) => JournalEntry.fromJson(data),
    toJson: (JournalEntry obj) => obj.toJson(),
  );
  await apodHive.ready();
  // await apodHive.clear();
  await journalHive.ready();

  appStateManager.initializeApp();

  // Create the full Apod Repository
  apodRepository = Repository<Apod>(
    sourceList: [
      LocalMemorySource<Apod>(),
      apodHive,
      ApiSource<Apod>(
        api: ApodApi.create(),
        fromJson: (Map<String, dynamic> data) => Apod.fromJson(data),
      )
    ],
  );

  // Create the full JournalEntry Repository
  journalRepository = Repository<JournalEntry>(
    sourceList: [
      LocalMemorySource<JournalEntry>(),
      journalHive,
    ],
  );

  runApp(const ApodApp());
}

class ApodApp extends StatelessWidget {
  const ApodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => JournalManager(journalRepository),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoritesManager(apodRepository),
        ),
        BlocProvider<ApodBloc>.value(value: ApodBloc(apodRepository)),
        ChangeNotifierProvider.value(value: appStateManager),
      ],
      child: MaterialApp.router(
        title: 'APOD',
        theme: ApodTheme.light(),
        darkTheme: ApodTheme.dark(),
        debugShowCheckedModeBanner: false,
        routerDelegate: goRouter.routerDelegate,
        routeInformationParser: goRouter.routeInformationParser,
      ),
    );
  }
}
