import 'package:apod/features/shared/models/models.dart';
import 'package:apod/features/shared/extensions.dart';
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

  Future<Apod?> getApod([DateTime? date]) {
    date ??= DateTime.now().toUtc();
    return _repository.getItem(date.dateString());
  }

  Future<List<Apod>?> getRecentApods({int minDesired = 15}) async {
    List<Apod> items = await _repository.getItems();
    if (items.length < minDesired) {
      items = await _repository.getItems(type: RequestType.remote);
    }
    return items..sort((a, b) => b.id.compareTo(a.id));
  }

  Future<List<String>> get favoriteIds async => _repository.getFavoriteIds();

  Future<bool> isFavorited(String id) async => (await favoriteIds).contains(id);

  Future<List<Apod>> getFavoriteApods() async {
    final favApods = <Apod>[];
    final _favoriteIds = await favoriteIds;
    for (String id in _favoriteIds) {
      final obj = (await _repository.getItem(id))!;
      favApods.add(obj);
    }
    return favApods;
  }
}
