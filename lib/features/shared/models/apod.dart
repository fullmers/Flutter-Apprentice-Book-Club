import 'models.dart';

/// Data model to hold information about the APOD

class Apod extends DataModel {
  const Apod({
    required String id,
    this.date,
    this.mediaType = MediaType.image,
    this.copyright = 'Public domain',
    this.title = '',
    this.explanation = '',
    this.displayImageUrl = '',
    this.hdUrl,
    this.videoUrl,
  }) : super(id: id);

  /// Date the APOD was published, not when the photo or video was taken
  final DateTime? date;

  /// Specify if the APOD an image or video
  /// Defaults to image, as a strong majority of apods are images
  final MediaType mediaType;

  /// Copyright owner(s) of the image or video. Only present in API if it is
  /// not in the public domain. Default value of 'Public domain'
  final String copyright;

  /// Title of the image or video
  final String title;

  /// Prose text with an explanation of the image or video
  final String explanation;

  /// For now, this contains the local asset path location
  /// Later, it will be the url to a smaller (though not necessarily small)
  /// version of the APOD image, if the MediaType is image.
  /// Otherwise, it's a url to a video thumbnail, if available (null if not)
  final String? displayImageUrl;

  /// Optional url to an HD version of the APOD, if the MediaType is image.
  /// Null if it is a video.
  final String? hdUrl;

  /// Optional url to the video, if the APOD is a video.
  /// Null if it is an image.
  final String? videoUrl;

  @override
  String toString() => 'Apod($id)';

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'date': date,
        'media_type': mediaType.toString().split('.')[1],
        'copyright': copyright,
        'title': title,
        'explanation': explanation,
        'hdurl': hdUrl,
        'url': mediaType == MediaType.video ? videoUrl : displayImageUrl,
      };

  /// create an Apod using json data from the API (mocked service or real)
  /// Note: The logic in this method is something we would generally want handled on the
  /// server. For now, however, we will keep it here.
  factory Apod.fromJson(Map<String, dynamic> json) {
    // the API returns a string in the form YYYY-MM-DD. Here we parse and turn
    // it into the DateTime object required by the Apod constructor
    DateTime? date;
    final rawDate = json['date'];

    if (rawDate is String) {
      final dateParts = rawDate.split('-');
      if (dateParts.length == 3) {
        final year = int.parse(dateParts[0]);
        final month = int.parse(dateParts[1]);
        final day = int.parse(dateParts[2]);
        date = DateTime(year, month, day);
      }
    } else if (rawDate is DateTime) {
      date = rawDate;
    }

    final mediaType =
        json['media_type'] == 'image' ? MediaType.image : MediaType.video;

    // if it is an image, we want to display the apod image. if it is a video,
    // we want to display the video thumbnail image
    // We can display jpg's and png's, but sometimes the api returns avif and other
    // unsupported image formats for thumbnails. In this case, we display a
    // simple play button icon
    String? displayImageUrl;
    if (mediaType == MediaType.image) {
      displayImageUrl = json['url'];
    } else {
      final fileName = json['thumbnail_url'].toString().split('/').last;
      final fileType = fileName.split('.').last.toLowerCase();
      if (fileType.contains('jpeg') ||
          fileType.contains('jpg') ||
          fileType.contains('png')) {
        displayImageUrl = json['thumbnail_url'];
      }
    }

    final videoUrl = mediaType == MediaType.video ? json['url'] : null;

    // the API returns nothing in the 'copyright' field if the apod is in the
    // public domain.
    // Here this ?? is shorthand for:
    // json['copyright'] == null ? 'Public domain' : json['copyright'];
    final String copyright = json['copyright'] ?? 'Public domain';

    return Apod(
      id: json['id'].toString(),
      date: date,
      mediaType: mediaType,
      copyright: copyright,
      title: json['title'] ?? '',
      explanation: json['explanation'] ?? '',
      displayImageUrl: displayImageUrl,
      hdUrl: json['hdurl'],
      videoUrl: videoUrl,
    );
  }
}

/// Used to specify whether the Apod is an image or video
enum MediaType { image, video }
