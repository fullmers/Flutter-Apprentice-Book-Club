import 'package:apod/features/shared/models/models.dart';
import 'package:flutter/foundation.dart';

import 'models.dart';

class JournalManager extends ChangeNotifier {
  JournalManager(this._repository);
  final Repository<JournalEntry> _repository;

  Future<List<JournalEntry>> get entries => _repository.getItems();

  void deleteItem(JournalEntry item) {
    _repository.deleteItem(item);
    notifyListeners();
  }

  Future<JournalEntry?> getItem(String id) async => _repository.getItem(id);

  void setItem(JournalEntry item) {
    _repository.setItem(item);
    notifyListeners();
  }
}
