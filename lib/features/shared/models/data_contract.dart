import 'repository.dart';

/// Minimum set of functionality required to store data objects in a
/// [Repository].
abstract class DataModel {
  const DataModel({required this.id});
  final String id;
}

/// Definition of the minimum set of methods we require to manage our app's
/// data.
abstract class DataContract<T extends DataModel> {
  /// Saves the given item.
  Future<void> setItem(T obj);

  /// Retreives an item associated with the given [id], if it exists.
  Future<T?> getItem(String id);

  /// Retrieves all known items.
  Future<List<T>> getItems();

  /// Retrieves all items "favorited" by the active user.
  ///
  /// Returns an empty list if the user has not favorited any items.
  Future<List<String>> getFavoriteIds();

  /// Marks the supplied [id] as "favorited" by the active user.
  Future<void> setFavorite(String id, bool isFavorited);

  /// Flips the active user's "favorited" status of the given [id].
  Future<void> toggleFavorite(String id);
}

/// Type of [DataContract] subclass that is responsible for yielding real data.
abstract class Source<T extends DataModel> extends DataContract<T> {
  SourceType get type;
}

enum RequestType { local, remote, any }
enum SourceType { local, remote }
