import 'package:flutter_test/flutter_test.dart';
import 'package:apod/api/apod_api.dart';

void main() {
  group('ApodRequestParameters should', () {
    test('serialize with correct field names', () {
      final params = ApodRequestParameters(
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        date: DateTime.now(),
        count: 5,
      );
      final serialized = params.toJson();
      expect(serialized, contains('start_date'));
      expect(serialized, contains('end_date'));
      expect(serialized, contains('date'));
      expect(serialized, contains('count'));
    });
  });

  group('ApodApi should', () {
    test('remove empty query parameters', () {
      final queryParams =
          const ApodApi().flattenParameters(ApodRequestParameters(
        startDate: DateTime.now(),
      ));
      expect(queryParams, contains('start_date'));
      expect(queryParams.containsKey('end_date'), false);
      expect(queryParams.containsKey('date'), false);
      expect(queryParams.containsKey('count'), false);
    });
  });
}
