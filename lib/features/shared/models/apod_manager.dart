import 'package:apod/features/shared/models/models.dart';
import 'package:apod/features/shared/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApodManager extends StateNotifier<ApodState> {
  /// Public constructor which accepts a `Repository<Repo>` instance
  /// for long-lived persistence of favorites.
  ApodManager(this._repository) : super(ApodState.initial());

  final Repository<Apod> _repository;

  Future<void> toggleFavorite(String id) async {
    _repository.toggleFavorite(id);
    getFavoriteApods();
  }

  Future<void> getFavoriteApods() async {
    final _favs = <Apod>[];
    for (final id in await _repository.getFavoriteIds()) {
      _favs.add((await _repository.getItem(id))!);
    }
    state = state.copyWith(favoriteApods: _favs);
  }

  Future<void> getApod([DateTime? date]) async {
    date ??= DateTime.now();
    final apod = await _repository.getItem(date.dateString());
    state = state.copyWith(primaryApod: apod);
  }

  Future<void> getRecentApods({int minDesired = 15}) async {
    List<Apod> items = await _repository.getItems();
    if (items.length < minDesired) {
      items = await _repository.getItems(type: RequestType.remote);
    }
    state = state.copyWith(apods: items..sort((a, b) => b.id.compareTo(a.id)));
  }
}
