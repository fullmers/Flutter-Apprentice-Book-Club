import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'models.dart';

class FirestoreSource<T extends DataModel> extends StreamSource<T> {
  FirestoreSource({
    required this.collectionName,
    required this.fromJson,
    required this.toJson,
  }) {
    collection =
        firestore.FirebaseFirestore.instance.collection(collectionName);
  }

  final String collectionName;
  final T Function(Map<String, dynamic> json) fromJson;
  final Map<String, dynamic> Function(T obj) toJson;
  late final firestore.CollectionReference collection;

  @override
  SourceType get type => SourceType.remote;

  T fromDocument(firestore.DocumentSnapshot document) => fromJson(
        {
          ...(document.data() as Map).cast<String, dynamic>(),
          ...{'id': document.id},
        },
      );

  @override
  Future<void> deleteItem(T item) async =>
      await collection.doc(item.id).delete();

  @override
  Future<T?> getItem(String id) async =>
      fromDocument(await collection.doc(id).get());

  @override
  Future<List<T>> getItems() async => (await collection.get())
      .docs
      .map<T>(
        (doc) => fromDocument(doc),
      )
      .toList();

  @override
  Future<T> setItem(T obj) async {
    late firestore.DocumentReference docRef;
    if (obj.id != null) {
      // If the object is new, do the Firebase equivalent of POST
      docRef = await collection.add(toJson(obj));
    } else {
      // If the object already exists, do the Firebase equivalent of
      // PUT / PATCH.
      await collection.doc(obj.id).set(toJson(obj));
      docRef = collection.doc(obj.id);
    }

    // Return a reloaded document in case it had any fields that were
    // resolved on the server.
    return fromDocument(await docRef.get());
  }

  @override
  Future<void> setFavorite(String id, bool isFavorited) =>
      throw Exception('Cannot call FirestoreSource.setFavorite');

  @override
  Future<List<String>> getFavoriteIds() =>
      throw Exception('Cannot call FirestoreSource.getFavoriteIds');

  @override
  Future<void> toggleFavorite(String id) =>
      throw Exception('Cannot call FirestoreSource.toggleFavorite');

  @override
  Stream<List<T>> subscribeTo(List<WhereClause>? where) async* {
    // `collection.where()` returns a `Query`, so we'll think about things in
    // that way right off the bat.
    firestore.Query query = collection;
    if (where != null) {
      for (final whereClause in where) {
        if (whereClause.type == FilterType.equals) {
          query = query.where(
            whereClause.fieldName,
            isEqualTo: whereClause.value,
          );
        } else {
          // Did not use Freezed to build `FilterType` (to highlight this - we
          // could have), so this check is required so we don't forget to honor
          // future values. Long live Freezed's `map` method!
          throw Exception('Failed to handle FilterType of ${whereClause.type}');
        }
      }
    }

    Stream<firestore.QuerySnapshot> snapshots = query.snapshots();

    yield* snapshots.map<List<T>>(
      (firestore.QuerySnapshot snapshot) =>
          snapshot.docs.map<T>(fromDocument).toList(),
    );
  }
}
