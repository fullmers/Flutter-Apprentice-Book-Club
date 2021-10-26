import 'package:flutter/foundation.dart';

import 'models.dart';

class JournalManager extends ChangeNotifier {
  final List<JournalEntry> _entries = <JournalEntry>[];

  /// Returns an unmodifiable copy of all known [JournalEntry] objects.
  List<JournalEntry> get entries => List.unmodifiable(_entries);

  void deleteItem(int index) {
    _entries.removeAt(index);
    notifyListeners();
  }

  void addItem(JournalEntry item) {
    _entries.add(item);
    notifyListeners();
  }

  void updateItem(JournalEntry item, int index) {
    _entries[index] = item;
    notifyListeners();
  }
}
