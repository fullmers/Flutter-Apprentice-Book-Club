import 'package:apod/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'api/mock_apod_service.dart';
import 'apod_theme.dart';
import 'features/home/home.dart';
import 'features/shared/models/models.dart';
import 'models/models.dart';

late Repository<Apod> apodRepository;

void main() async {
  // This is required if we want to access platform channels.
  WidgetsFlutterBinding.ensureInitialized();
  appStateManager.initializeApp();

  // Initialize Hive and a persistence wrapper
  await Hive.initFlutter();
  final apodHive = LocalPersistenceSource<Apod>(
    fromJson: (Map<String, dynamic> data) => Apod.fromJson(data),
    toJson: (Apod obj) => obj.toJson(),
  );
  await apodHive.ready();

  // Create the fully Repository
  apodRepository = Repository<Apod>(
    sourceList: [
      LocalMemorySource<Apod>(),
      apodHive,
    ],
  );

  /// This is cheating! In Chapters 10 and 11, we will replace this with real
  /// calls to the APOD API.
  final apodService = MockApodService();
  (await apodService.getRecentApods()).forEach(apodRepository.setItem);

  runApp(const ApodApp());
}

class ApodApp extends StatelessWidget {
  const ApodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => JournalManager()),
        ChangeNotifierProvider(
          create: (context) => FavoritesManager(apodRepository),
        ),
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
