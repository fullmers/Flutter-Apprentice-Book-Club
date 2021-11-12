import 'package:flutter_test/flutter_test.dart';
import 'package:apod/features/shared/models/models.dart';

void main() {
  group('Apod deserialization should', () {
    test('honor video media type', () {
      final data = <String, dynamic>{
        'id': '1',
        'media_type': 'video',
        'url': 'some-url'
      };

      expect(
        Apod.fromJson(data),
        const Apod(id: '1', mediaType: MediaType.video, url: 'some-url'),
      );
    });

    test('honor image media type', () {
      final data = <String, dynamic>{
        'id': '1',
        'media_type': 'image',
        'url': 'some-url'
      };

      expect(
        Apod.fromJson(data),
        const Apod(id: '1', mediaType: MediaType.image, url: 'some-url'),
      );
    });
  });
}
