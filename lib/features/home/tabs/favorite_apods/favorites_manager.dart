import 'package:flutter/foundation.dart';

class FavoritesManager extends ChangeNotifier {
  final Set<int> _favoriteIds = <int>{};

  void _addFavorite(int id) {
    _favoriteIds.add(id);
    // ignore: avoid_print
    print('Favorites: $_favoriteIds');
    notifyListeners();
  }

  void _removeFavorite(int id) {
    _favoriteIds.remove(id);
    // ignore: avoid_print
    print('Favorites: $_favoriteIds');
    notifyListeners();
  }

  void toggleFavorite(int id) =>
      isFavorited(id) ? _removeFavorite(id) : _addFavorite(id);

  Set<int> get favoriteIds => _favoriteIds;

  bool isFavorited(int id) => _favoriteIds.contains(id);
}
