import 'package:apod/features/current_apod/current_apod_page.dart';
import 'package:apod/features/favorite_apods/favorites_apod_page.dart';
import 'package:apod/features/recent_apods/recent_apod_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/journal/journal.dart';
import 'models/models.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  static Page page({LocalKey? key}) => MaterialPage<void>(
        key: key,
        child: const HomePage(title: 'Astronomy Picture of the Day'),
      );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<Widget> pages = [
    const CurrentApodPage(),
    const RecentApodPage(),
    const FavoritesApodPage(),
    const JournalPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(
        builder: (context, appStateManager, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(
          child: IndexedStack(
            index: appStateManager.selectedTab,
            children: pages,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: appStateManager.selectedTab,
          onTap: appStateManager.goToTab,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.photo),
              label: 'APOD',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Recent',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Journal',
            ),
          ],
        ),
      );
    });
  }
}
