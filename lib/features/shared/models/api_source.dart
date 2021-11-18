import 'package:apod/api/result.dart';
import 'package:apod/features/shared/extensions.dart';
import 'package:apod/api/apod_api.dart';
import 'package:chopper/chopper.dart';

import 'models.dart';

class ApiSource<T extends DataModel> extends Source<T> {
  ApiSource({required this.api, required this.fromJson});

  @override
  SourceType type = SourceType.remote;

  final ApodApi api;
  final T Function(Map<String, dynamic> json) fromJson;

  @override
  Future<List<String>> getFavoriteIds() async => <String>[];

  @override
  Future<T?> getItem(String id) async {
    final Response<Result<Apod>> response = await api.detail(
      date: id.toDateTimeAsDateString(),
    );

    if (response.body is Success) {
      return ((response.body! as Success<Apod>).value as T);
    } else {
      // ignore: avoid_print
      print(response.error);
    }
  }

  @override
  Future<List<T>> getItems() async {
    final Response<Result<List<Apod>>> response = await api.list(
      endDate: DateTime.now(),
      startDate: DateTime.now().subtract(const Duration(days: 15)),
    );

    if (response.body is Success) {
      return ((response.body! as Success<List<Apod>>).value as List<T>);
    }
    return <T>[];
  }

  @override
  Future<void> setFavorite(String id, bool isFavorited) async {}

  @override
  Future<void> setItem(T obj) async {}

  @override
  Future<void> toggleFavorite(String id) async {}

  @override
  Future<void> deleteItem(T item) async {}
}
