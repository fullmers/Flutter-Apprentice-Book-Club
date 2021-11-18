import 'package:apod/api/apod_converter.dart';
import 'package:apod/features/shared/extensions.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ApodConverter should', () {
    test('turn DateTime query parameters into Strings', () {
      final date = DateTime.now();
      final req1 = Request('GET', 'url', '/', parameters: {
        'date': date,
      });
      final req2 = Request('GET', 'url', '/', parameters: {
        'date': date.dateString(),
      });
      expect(ApodConverter().convertRequest(req1).parameters, req2.parameters);
    });
  });
}
