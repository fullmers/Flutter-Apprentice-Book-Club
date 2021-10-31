import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'apod_theme.dart';
import 'home_page.dart';
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
      child: MaterialApp(
        title: 'APOD',
        theme: ApodTheme.light(),
        darkTheme: ApodTheme.dark(),
        debugShowCheckedModeBanner: false,
        home: const HomePage(title: 'Astronomy Picture of the Day'),
      ),
    );
  }
}
