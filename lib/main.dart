import 'package:apod/features/shared/models/persistence.dart';
import 'package:apod/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'apod_theme.dart';
import 'features/home/home.dart';
import 'models/models.dart';

late SharedPreferences sharedPreferences;

void main() async {
  /// This is required if we want to access platform channels.
  WidgetsFlutterBinding.ensureInitialized();
  appStateManager.initializeApp();
  sharedPreferences = await SharedPreferences.getInstance();
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
          create: (context) => FavoritesManager(
            SharedPreferencesPersistence(sharedPreferences),
          ),
        ),
        ChangeNotifierProvider(create: (context) => appStateManager),
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
