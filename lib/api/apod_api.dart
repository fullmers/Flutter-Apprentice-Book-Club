import 'package:apod/api/result.dart';
import 'package:apod/features/shared/extensions.dart';
import 'package:apod/features/shared/models/models.dart';
import 'package:chopper/chopper.dart';
import 'apod_converter.dart';
import 'secrets.dart';

part 'apod_api.chopper.dart';

const apiUrl = 'https://api.nasa.gov/planetary/apod';

/// Entrypoint for making network requests to the real Apod API.
@ChopperApi()
abstract class ApodApi extends ChopperService {
  @Get()
  Future<Response<Result<List<Apod>>>> list({
    @Query('start_date') required DateTime startDate,
    @Query('end_date') required DateTime endDate,
  });

  @Get()
  Future<Response<Result<Apod>>> detail({
    @Query('date') required DateTime date,
  });

  static Request _addQuery(Request req) {
    final params = Map<String, dynamic>.from(req.parameters);
    params['api_key'] = apodApiKey;
    return req.copyWith(parameters: params);
  }

  static Request _flattenDates(Request req) {
    Map<String, dynamic> parameters = req.parameters;

    if (parameters['date'] is DateTime) {
      parameters['date'] = (parameters['date'] as DateTime).dateString();
    }
    if (parameters['start_date'] is DateTime) {
      parameters['start_date'] =
          (parameters['start_date'] as DateTime).dateString();
    }
    if (parameters['end_date'] is DateTime) {
      parameters['end_date'] =
          (parameters['end_date'] as DateTime).dateString();
    }

    return req.copyWith(parameters: parameters);
  }

  static ApodApi create() {
    final client = ChopperClient(
      baseUrl: apiUrl,
      interceptors: [_addQuery, _flattenDates, HttpLoggingInterceptor()],
      converter: ApodConverter(),
      errorConverter: const JsonConverter(),
      services: [
        _$ApodApi(),
      ],
    );
    return _$ApodApi(client);
  }
}
