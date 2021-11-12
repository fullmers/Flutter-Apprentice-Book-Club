// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'models.dart';

part 'apod.freezed.dart';
part 'apod.g.dart';

/// Data model to hold information about the APOD
@Freezed()
class Apod extends DataModel with _$Apod {
  @JsonSerializable(explicitToJson: true)
  const factory Apod({
    required String id,

    /// Date the APOD was published, not when the photo or video was taken
    DateTime? date,

    /// Specify if the APOD an image or video
    /// Defaults to image, as a strong majority of apods are images
    @JsonKey(name: 'media_type')
    @MediaTypeConverter()
    @Default(MediaType.image)
        MediaType mediaType,

    /// Copyright owner(s) of the image or video. Only present in API if it is
    /// not in the public domain. Default value of 'Public domain'
    @Default('Public Domain') String copyright,

    /// Title of the image or video
    @Default('') String title,

    /// Prose text with an explanation of the image or video
    @Default('') String explanation,

    /// The raw URL returned from the API.
    @Default('') String url,

    /// Thumbnail URL. Null if it is an image.
    @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
  }) = _Apod;

  // Super secret constructor which is just used to make the analysis engine
  // happy. This is required for Freezed to wire up `getter`s, but is never
  // actually used.
  const Apod._() : super(id: '');

  /// Optional url to an HD version of the APOD, if the MediaType is image.
  /// Null if it is a video.
  String? get hdUrl => mediaType == MediaType.image ? url : null;

  /// Optional url to the video, if the APOD is a video.
  /// Null if it is an image.
  String? get videoUrl => mediaType == MediaType.video ? url : null;

  /// For now, this contains the local asset path location
  /// Later, it will be the url to a smaller (though not necessarily small)
  /// version of the APOD image, if the MediaType is image.
  /// Otherwise, it's a url to a video thumbnail, if available (null if not)
  String? get displayImageUrl {
    String? displayImageUrl;
    if (mediaType == MediaType.image) {
      displayImageUrl = url;
    } else if (thumbnailUrl != null) {
      final fileName = thumbnailUrl.toString().split('/').last;
      final fileType = fileName.split('.').last.toLowerCase();
      if (fileType.contains('jpeg') ||
          fileType.contains('jpg') ||
          fileType.contains('png')) {
        displayImageUrl = thumbnailUrl!;
      }
    }
    return displayImageUrl;
  }

  /// Constructor which accepts a JSON-serialized [Apod] and returns a
  /// fully-formed [Apod] instance.
  factory Apod.fromJson(Map<String, dynamic> json) => _$ApodFromJson(json);
}

/// JSON converter helper for the enum [MediaType].
///
/// Might be tempted to make this private, but it should be tested.
class MediaTypeConverter implements JsonConverter<MediaType, String> {
  const MediaTypeConverter();
  @override
  MediaType fromJson(String type) => <String, MediaType>{
        'image': MediaType.image,
        'video': MediaType.video,
      }[type]!;

  @override
  String toJson(MediaType type) => type.toString().split('.')[1];
}

/// Used to specify whether the Apod is an image or video
enum MediaType { image, video }
