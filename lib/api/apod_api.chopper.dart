// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apod_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ApodApi extends ApodApi {
  _$ApodApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApodApi;

  @override
  Future<Response<Result<List<Apod>>>> list(
      {required DateTime startDate, required DateTime endDate}) {
    final $url = '';
    final $params = <String, dynamic>{
      'start_date': startDate,
      'end_date': endDate
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<Result<List<Apod>>, Apod>($request);
  }

  @override
  Future<Response<Result<Apod>>> detail({required DateTime date}) {
    final $url = '';
    final $params = <String, dynamic>{'date': date};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<Result<Apod>, Apod>($request);
  }
}
