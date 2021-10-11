/// Data class to hold information about the APOD

class Apod {
  /// date the apod was published
  final DateTime? date;

  /// media type
  final MediaType? mediaType;

  /// title of the image or video
  final String? title;

  /// copyright owner of the image or video
  final String? copyright;

  /// paragraph prose text with an explanation of the image or video
  final String? explanation;

  /// url to a smaller (though not necessarily small) version of the APOD, if image
  /// otherwise, url to video
  final String? url;

  /// url to an HD version of an APOD image. Null if a video.
  final String? hdurl;

  /// if the apod is a video, this is the url of the thumb image. Comes from Youtube
  final String? thumb;

  const Apod({
    this.copyright,
    this.date,
    this.mediaType,
    this.explanation,
    this.title,
    this.url,
    this.hdurl,
    this.thumb,
  });
}

enum MediaType { image, video }
