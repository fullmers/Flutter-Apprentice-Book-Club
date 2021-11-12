import 'models.dart';

class LocalMemorySource<T extends DataModel> extends Source<T> {
  LocalMemorySource()
      : _items = <String, T>{},
        _favoritedIds = <String>{};

  @override
  SourceType type = SourceType.local;

  final Map<String, T> _items;
  final Set<String> _favoritedIds;

  @override
  Future<List<String>> getFavoriteIds() async => _favoritedIds.toList();

  @override
  Future<T?> getItem(String id) async => _items[id];

  @override
  Future<List<T>> getItems() async => _items.values.toList();

  @override
  Future<void> setFavorite(String id, bool isFavorited) async =>
      isFavorited ? _favoritedIds.add(id) : _favoritedIds.remove(id);

  @override
  Future<void> setItem(T obj) async => _items[obj.id] = obj;

  @override
  Future<void> toggleFavorite(String id) async =>
      setFavorite(id, !_favoritedIds.contains(id));
}
