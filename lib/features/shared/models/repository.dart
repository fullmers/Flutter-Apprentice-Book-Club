import 'models.dart';

class Repository<T extends DataModel> extends DataContract<T> {
  Repository({required this.sourceList});

  final List<Source<T>> sourceList;

  bool isMatchedSource(Source source, RequestType type) {
    if (type == RequestType.any) return true;
    return source.type == SourceType.local
        ? type == RequestType.local
        : type == RequestType.remote;
  }

  @override
  Future<List<String>> getFavoriteIds() async {
    final emptySources = <Source<T>>[];
    List<String> favoriteIds = [];

    // Check each [Source] for an answer.
    for (final source in sourceList) {
      favoriteIds = await source.getFavoriteIds();

      // Note which sources have no info.
      if (favoriteIds.isEmpty) {
        emptySources.add(source);
      } else {
        break;
      }
    }

    // If we found an answer, but some of our sources were unsure, store that
    // answer in each of those sources.
    if (favoriteIds.isNotEmpty && emptySources.isNotEmpty) {
      for (final source in emptySources) {
        for (final id in favoriteIds) {
          source.setFavorite(id, true);
        }
      }
    }

    return favoriteIds;
  }

  @override
  Future<T?> getItem(String id) async {
    final emptySources = <Source<T>>[];
    T? item;

    // Check each [Source] for an answer.
    for (final source in sourceList) {
      item = await source.getItem(id);

      // Note which sources have no info.
      if (item == null) {
        emptySources.add(source);
      } else {
        break;
      }
    }

    // If we found an answer, but some of our sources were unsure, store that
    // answer in each of those sources.
    if (item != null && emptySources.isNotEmpty) {
      for (final source in emptySources) {
        await source.setItem(item);
      }
    }

    return item;
  }

  @override
  Future<List<T>> getItems({
    RequestType type = RequestType.any,
  }) async {
    final emptySources = <Source<T>>[];
    List<T> items = [];

    // Check each [Source] for an answer.
    for (final source in sourceList) {
      // For now, only implemented `RequestType` functionality on `getItems()`,
      // but, of course, it could be implemented on every method.
      if (!isMatchedSource(source, type)) {
        emptySources.add(source);
        continue;
      }

      items = await source.getItems();

      // Note which sources have no info.
      if (items.isEmpty) {
        emptySources.add(source);
      } else {
        break;
      }
    }

    // If we found an answer, but some of our sources were unsure, store that
    // answer in each of those sources.
    if (items.isNotEmpty && emptySources.isNotEmpty) {
      for (final source in emptySources) {
        for (final item in items) {
          source.setItem(item);
        }
      }
    }

    return items;
  }

  @override
  Future<void> setFavorite(String id, bool isFavorited) async {
    for (final source in sourceList) {
      source.setFavorite(id, isFavorited);
    }
  }

  @override
  Future<void> setItem(T obj) async {
    for (final source in sourceList) {
      source.setItem(obj);
    }
  }

  @override
  Future<void> toggleFavorite(String id) async {
    for (final source in sourceList) {
      source.toggleFavorite(id);
    }
  }
}
