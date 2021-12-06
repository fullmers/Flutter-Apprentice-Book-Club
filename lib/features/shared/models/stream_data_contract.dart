import 'models.dart';

abstract class StreamDataContract<T extends DataModel> extends DataContract<T> {
  Stream<List<T>> subscribeTo(List<WhereClause>? where);
}

abstract class StreamSource<T extends DataModel> extends Source<T> {
  Stream<List<T>> subscribeTo(List<WhereClause>? where);
}
