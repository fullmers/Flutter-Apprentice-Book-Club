import 'package:hive/hive.dart';
import 'models.dart';

class LocalPersistenceSource<T extends DataModel> extends Source<T> {
  LocalPersistenceSource({
    required this.fromJson,
    required this.toJson,
  });

  @override
  SourceType type = SourceType.local;

  // <String, T>
  late Box _itemsBox;

  // <String, bool> (value for bool is always True)
  late Box _favoritesBox;

  final T Function(Map<String, dynamic>) fromJson;
  final Map<String, dynamic> Function(T) toJson;

  Future<void> ready() async {
    _itemsBox = await Hive.openBox(_itemsBoxName);
    _favoritesBox = await Hive.openBox(_favoritesBoxName);
  }

  String get _itemsBoxName => '${T.toString()}-items';
  String get _favoritesBoxName => '${T.toString()}-favorites';

  Future<void> clear() async {
    _itemsBox.clear();
    _favoritesBox.clear();
  }

  @override
  Future<List<String>> getFavoriteIds() async =>
      _favoritesBox.keys.cast<String>().toList();

  @override
  Future<T?> getItem(String id) async {
    final data = _itemsBox.get(id);
    return data != null ? fromJson(data.cast<String, dynamic>()) : null;
  }

  @override
  Future<List<T>> getItems() async => _itemsBox.values
      .map<T>((data) => fromJson(data.cast<String, dynamic>()))
      .toList();

  @override
  Future<void> setFavorite(String id, bool isFavorited) async =>
      isFavorited ? _favoritesBox.delete(id) : _favoritesBox.put(id, true);

  @override
  Future<void> setItem(T obj) => _itemsBox.put(
        obj.id,
        toJson(obj),
      );

  @override
  Future<void> toggleFavorite(String id) async => _favoritesBox.containsKey(id)
      ? _favoritesBox.delete(id)
      : _favoritesBox.put(id, true);

  @override
  Future<void> deleteItem(T item) async {
    _itemsBox.delete(item.id);
    _favoritesBox.delete(item.id);
  }
}
