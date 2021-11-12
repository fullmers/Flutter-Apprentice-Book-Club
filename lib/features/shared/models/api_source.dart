import 'package:apod/api/apod_api.dart';

import 'models.dart';

class ApiSource<T extends DataModel> extends Source<T> {
  ApiSource({required this.api, required this.fromJson});

  final ApodApi api;
  final T Function(Map<String, dynamic> json) fromJson;

  @override
  Future<List<String>> getFavoriteIds() async => <String>[];

  @override
  Future<T?> getItem(String id) async {
    final Map<String, dynamic>? data = await api.read<Map<String, dynamic>>(
      params: ApodRequestParameters(date: fromDateString(id)),
    );

    return data != null ? fromJson(data) : null;
  }

  @override
  Future<List<T>> getItems() async {
    final params = ApodRequestParameters(
      endDate: DateTime.now(),
      startDate: DateTime.now().subtract(const Duration(days: 15)),
    );

    final List<Map<String, dynamic>>? data =
        await api.read<List<Map<String, dynamic>>>(params: params);

    return data?.map<T>(fromJson).toList() ?? <T>[];
  }

  @override
  Future<void> setFavorite(String id, bool isFavorited) async {}

  @override
  Future<void> setItem(T obj) async {}

  @override
  Future<void> toggleFavorite(String id) async {}
}

DateTime fromDateString(String dateString) {
  final List<String> parts = dateString.split('-');
  return DateTime(
    int.parse(parts[0]),
    int.parse(parts[1]),
    int.parse(parts[2]),
  );
}
