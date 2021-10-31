import 'package:apod/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'apod_theme.dart';
import 'models/models.dart';

void main() {
  runApp(const ApodApp());
}

class ApodApp extends StatelessWidget {
  const ApodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APOD',
      theme: ApodTheme.light(),
      darkTheme: ApodTheme.dark(),
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => JournalManager()),
          ChangeNotifierProvider(create: (context) => AppStateManager()),
        ],
        child: const HomePage(title: 'Astronomy Picture of the Day'),
      ),
    );
  }
}
