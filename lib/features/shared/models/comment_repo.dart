import 'models.dart';

class CommentRepository<T extends Comment> extends Repository<T> {
  CommentRepository({required List<Source<T>> sourceList})
      : super(sourceList: sourceList);

  Stream<List<T>> subscribeTo(List<WhereClause>? where) {
    final source = sourceList.last as StreamSource<T>;
    final nonStreamSources = sourceList.sublist(0, sourceList.length - 1);
    return source.subscribeTo(where).asBroadcastStream()
      ..listen(
        (List<T> objects) {
          for (final Source<T> source in nonStreamSources) {
            for (final T obj in objects) {
              source.setItem(obj);
            }
          }
        },
      );
  }
}
