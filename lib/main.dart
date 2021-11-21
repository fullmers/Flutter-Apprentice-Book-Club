import 'package:apod/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as og_provider;

import 'apod_theme.dart';
import 'bootstrap.dart';
import 'models/models.dart';

void main() async {
  await bootstrap();
  runApp(
    const ProviderScope(
      child: ApodApp(),
    ),
  );
}

class ApodApp extends StatelessWidget {
  const ApodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return og_provider.MultiProvider(
      providers: [
        og_provider.ChangeNotifierProvider(
          create: (context) => JournalManager(journalRepository),
        ),
        og_provider.ChangeNotifierProvider.value(value: appStateManager),
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
