// ignore_for_file: invalid_annotation_target
import 'dart:convert';

import 'package:apod/features/shared/extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'secrets.dart';

part 'apod_api.freezed.dart';
part 'apod_api.g.dart';

/// Entrypoint for making network requests to the real Apod API.
class ApodApi {
  const ApodApi();

  static const baseUrl = 'https://api.nasa.gov/planetary/apod';

  Future<dynamic>? _request({
    ApodRequestParameters params = const ApodRequestParameters(),
  }) async {
    final uri = Uri.parse(baseUrl).replace(
      queryParameters: flattenParameters(params)
        ..addAll({'api_key': apodApiKey}),
    );
    final resp = await http.get(uri);
    // Convert "200 OK" responses into JSON.
    if (resp.statusCode == 200) {
      return resp.bodyBytes.isNotEmpty
          ? jsonDecode(utf8.decoder.convert(resp.bodyBytes))
          : null;
    } else {
      // ignore: avoid_print
      print(resp.body);
    }
  }

  /// Sends a request to the Apod Api and returns a list of results.
  Future<List<Map<String, dynamic>>?> list({
    ApodRequestParameters params = const ApodRequestParameters(),
  }) async {
    final List<dynamic> resp = await _request(params: params);
    return resp.cast<Map<String, dynamic>>();
  }

  /// Sends a request to the Apod Api and returns a single result.
  Future<Map<String, dynamic>?> detail({
    ApodRequestParameters params = const ApodRequestParameters(),
  }) async {
    final Map<dynamic, dynamic> resp = await _request(params: params);
    return resp.cast<String, dynamic>();
  }

  Map<String, dynamic> flattenParameters(ApodRequestParameters params) =>
      params.toJson()
        ..removeWhere((key, value) => value == null || value == '');
}

/// Container for customization of [ApodApi] requests.
@Freezed()
class ApodRequestParameters with _$ApodRequestParameters {
  const ApodRequestParameters._();

  @JsonSerializable(explicitToJson: true)
  const factory ApodRequestParameters({
    /// Optional filter for the earliest date from which we desire results.
    @OptionalDateTimeConverter()
    @JsonKey(name: 'start_date')
        DateTime? startDate,

    /// Optional filter for the latest date from which we desire results.
    @OptionalDateTimeConverter() @JsonKey(name: 'end_date') DateTime? endDate,

    /// Optional filter for only date from which we desire results.
    @OptionalDateTimeConverter() DateTime? date,

    /// Optional limit to how many results should be returned.
    int? count,
  }) = _ApodRequestParameters;

  factory ApodRequestParameters.fromJson(Map<String, dynamic> json) =>
      _$ApodRequestParametersFromJson(json);
}

class OptionalDateTimeConverter extends JsonConverter<DateTime?, String> {
  const OptionalDateTimeConverter();

  @override
  DateTime? fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime? object) => object != null ? object.dateString() : '';
}
