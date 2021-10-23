/// Data model to hold information about the APOD

class Apod {
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

  const Apod({
    this.date,
    this.mediaType = MediaType.image,
    this.copyright = 'Public domain',
    this.title = '',
    this.explanation = '',
    this.displayImageUrl = '',
    this.hdUrl,
    this.videoUrl,
  });

  /// create an Apod using json data from the API (mocked service or real)
  /// Note: The logic in this method is something we would generally want handled on the
  /// server. For now, however, we will keep it here.
  factory Apod.fromJson(Map<String, dynamic> json) {
    // the API returns a string in the form YYYY-MM-DD. Here we parse and turn
    // it into the DateTime object required by the Apod constructor
    final String dateString = json['date'];
    final dateParts = dateString.split('-');
    DateTime? date;
    if (dateParts.length == 3) {
      final year = int.parse(dateParts[0]);
      final month = int.parse(dateParts[1]);
      final day = int.parse(dateParts[2]);
      date = DateTime(year, month, day);
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

  /// sample data for starter app. It will eventually be replaced with data
  /// from the APOD API
  static List<Apod> samples = [
    Apod(
      date: DateTime(2021, 10, 9),
      mediaType: MediaType.image,
      copyright: 'Josselin Desmars',
      title: '50 Light-years to 51 Pegasi',
      explanation:
          'It\'s only 50 light-years to 51 Pegasi. That star\'s position is indicated in this snapshot from August, taken on a hazy night with mostly brighter stars visible above the dome at Observatoire de Haute-Provence in France. Twenty-six years ago, in October of 1995, astronomers Michel Mayor and Didier Queloz announced a profound discovery made at the observatory. Using a precise spectrograph they had detected a planet orbiting 51 Peg, the first known exoplanet orbiting a sun-like star. Mayor and Queloz had used the spectrograph to measure changes in the star\'s radial velocity, a regular wobble caused by the gravitational tug of the orbiting planet. Designated 51 Pegasi b, the planet was determined to have a mass at least half of Jupiter\'s mass and an orbital period of 4.2 days, making it much closer to its parent star than Mercury is to the Sun. Their discovery was quickly confirmed and Mayor and Queloz were ultimately awarded the Nobel Prize in physics in 2019. Now recognized as the prototype for the class of exoplanets fondly known as hot Jupiters, 51 Pegasi b was formally named Dimidium, latin for half, in 2015. Since its discovery, over 4,000 exoplanets have been found.',
      displayImageUrl:
          'assets/apod_images/2021-10-09-peg51_desmars_ex1024.jpeg',
    ),
    Apod(
      date: DateTime(2021, 10, 8),
      mediaType: MediaType.image,
      copyright: 'Jack Groves',
      title: 'The Double Cluster in Perseus',
      explanation:
          'This pretty starfield spans about three full moons (1.5 degrees) across the heroic northern constellation of Perseus. It holds the famous pair of open star clusters, h and Chi Persei. Also cataloged as NGC 869 (top) and NGC 884, both clusters are about 7,000 light-years away and contain stars much younger and hotter than the Sun.  Separated by only a few hundred light-years, the clusters are both 13 million years young based on the ages of their individual stars, evidence that they were likely a product of the same star-forming region. Always a rewarding sight in binoculars, the Double Cluster is even visible to the unaided eye from dark locations. But a shroud of guitar strings was used to produce diffraction spikes on the colorful stars imaged in this vibrant telescopic view.   Global Moon Party:  Including APOD\'s Best Moon Images: Saturday, October 9',
      displayImageUrl:
          'assets/apod_images/2021-10-08-doubleclustergroves1024.jpeg',
    ),
    Apod(
      date: DateTime(2021, 10, 7),
      mediaType: MediaType.image,
      copyright: 'Roberto Sartori',
      title: 'NGC 6559: East of the Lagoon',
      explanation:
          'Slide your telescope just east of the Lagoon Nebula to find this alluring field of view in the rich starfields of the constellation Sagittarius toward the central Milky Way. Of course the Lagoon nebula is also known as M8, the eighth object listed in Charles Messier\'s famous catalog of bright nebulae and star clusters. Close on the sky but slightly fainter than M8, this complex of nebulae was left out of Messier\'s list though. It contains obscuring dust, striking red emission and blue reflection nebulae of star-forming region NGC 6559 at right. Like M8, NGC 6559 is located about 5,000 light-years away along the edge of a large molecular cloud. At that distance, this telescopic frame nearly 3 full moons wide would span about 130 light-years.   Global Moon Party:  NASA\'s Night Sky Network: Saturday, October 9',
      displayImageUrl: 'assets/apod_images/2021-10-07-NGC6559Sartori1024.jpeg',
    ),
  ];
}

/// Used to specify whether the Apod is an image or video
enum MediaType { image, video }
