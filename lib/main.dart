import 'package:apod/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'apod_theme.dart';
import 'models/models.dart';

void main() {
  appStateManager.initializeApp();
  runApp(const ApodApp());
}

class ApodApp extends StatelessWidget {
  const ApodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => JournalManager()),
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
