import 'package:apod/features/shared/models/models.dart';
import 'package:flutter/foundation.dart';

class FavoritesManager extends ChangeNotifier {
  /// Public constructor which accepts a `Repository<Repo>` instance
  /// for long-lived persistence of favorites.
  FavoritesManager(this._repository);

  final Repository<Apod> _repository;

  Future<void> toggleFavorite(String id) async {
    _repository.toggleFavorite(id);
    notifyListeners();
  }

  Future<List<String>> get favoriteIds async => _repository.getFavoriteIds();

  Future<bool> isFavorited(String id) async => (await favoriteIds).contains(id);

  Future<List<Apod>> getFavoriteApods() async {
    final favApods = <Apod>[];
    for (String id in (await favoriteIds)) {
      favApods.add((await _repository.getItem(id))!);
    }
    return favApods;
  }
}
