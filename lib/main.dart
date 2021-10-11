import 'package:apod/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ApodApp());
}

class ApodApp extends StatelessWidget {
  const ApodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'APOD',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
        primary: Colors.purple,
        secondary: Colors.purpleAccent,
      )),
      home: const HomePage(title: 'Astronomy Picture of the Day'),
    );
  }
}
