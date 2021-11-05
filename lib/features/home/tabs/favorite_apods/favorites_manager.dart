import 'package:apod/features/shared/models/persistence.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesManager extends ChangeNotifier {
  /// Public constructor which accepts a [SharedPreferences] instance
  /// for long-lived persistence of favorites.
  FavoritesManager(this._persistence) {
    _readFromPersistence();
  }

  static const _storageKey = 'apod-favorites';
  final Set<String> _favoriteIds = <String>{};
  final Persistence _persistence;

  void _addFavorite(String id) {
    _favoriteIds.add(id);
    _syncToPersistence();
    notifyListeners();
  }

  void _removeFavorite(String id) {
    _favoriteIds.remove(id);
    _syncToPersistence();
    notifyListeners();
  }

  void _syncToPersistence() {
    final _idsAsString =
        favoriteIds.map<String>((String id) => id.toString()).join(',');
    _persistence.setKey(_storageKey, _idsAsString);
  }

  void _readFromPersistence() {
    final String? _idsAsString = _persistence.getKey(_storageKey);
    if (_idsAsString != null) {
      _favoriteIds.addAll(
        _idsAsString.split(',').toSet(),
      );
    }
  }

  void toggleFavorite(String id) =>
      isFavorited(id) ? _removeFavorite(id) : _addFavorite(id);

  Set<String> get favoriteIds => _favoriteIds;

  bool isFavorited(String id) => _favoriteIds.contains(id);
}
