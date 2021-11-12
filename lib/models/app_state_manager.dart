import 'package:flutter/material.dart';

class ApodTab {
  static const int today = 0;
  static const int recent = 1;
  static const int favorites = 2;
  static const int journal = 3;
}

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool _loggedIn = false;
  int _selectedTab = ApodTab.today;

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  int get selectedTab => _selectedTab;

  void initializeApp() {
    _initialized = true;
    notifyListeners();
  }

  void login(String username, String password) {
    _loggedIn = true;
    notifyListeners();
  }

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  /// Useful for deep links to a single tab. Should not be used
  /// during normal navigation.
  void silentlySetTab(int index) {
    _selectedTab = index;
  }

  void goToRecentApods() {
    _selectedTab = ApodTab.recent;
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    _initialized = false;
    _selectedTab = 0;

    initializeApp();
    notifyListeners();
  }
}

final AppStateManager appStateManager = AppStateManager();
