import 'package:apod/features/shared/extensions.dart';
import 'package:apod/api/apod_api.dart';

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
    final params = ApodRequestParameters(date: id.toDateTimeAsDateString());

    final Map<String, dynamic>? data = await api.detail(params: params);

    // The APOD Api has no concept of an Id - but that is essential to us.
    // We've decided to use Dates as Ids, because they serve a similar role
    // to the Apod Api. Thus, to keep our data models clean, we'll copy the
    // value found under the "date" key into the "id" key.
    if (data != null) {
      data['id'] = data['date'];
    }

    return data != null ? fromJson(data) : null;
  }

  @override
  Future<List<T>> getItems() async {
    final params = ApodRequestParameters(
      endDate: DateTime.now(),
      startDate: DateTime.now().subtract(const Duration(days: 15)),
    );

    final List<Map<String, dynamic>>? data = await api.list(params: params);

    // The APOD Api has no concept of an Id - but that is essential to us.
    // We've decided to use Dates as Ids, because they serve a similar role
    // to the Apod Api. Thus, to keep our data models clean, we'll copy the
    // value found under the "date" key into the "id" key.
    if (data != null) {
      for (final _entry in data) {
        _entry['id'] = _entry['date'];
      }
    }

    return data?.map<T>(fromJson).toList() ?? <T>[];
  }

  @override
  Future<void> setFavorite(String id, bool isFavorited) async {}

  @override
  Future<void> setItem(T obj) async {}

  @override
  Future<void> toggleFavorite(String id) async {}
}
