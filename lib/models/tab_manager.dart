import 'package:flutter/material.dart';

class TabManager extends ChangeNotifier {
  int selectedTab = 0;

  void goToTab(index) {
    selectedTab = index;
    notifyListeners();
  }

  void goToRecentApods() {
    selectedTab = 1;
    notifyListeners();
  }
}
