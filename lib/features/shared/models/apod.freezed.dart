// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'apod.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Apod _$ApodFromJson(Map<String, dynamic> json) {
  return _Apod.fromJson(json);
}

/// @nodoc
class _$ApodTearOff {
  const _$ApodTearOff();

  _Apod call(
      {required String id,
      DateTime? date,
      @JsonKey(name: 'media_type')
      @MediaTypeConverter()
          MediaType mediaType = MediaType.image,
      String copyright = 'Public Domain',
      String title = '',
      String explanation = '',
      String url = '',
      @JsonKey(name: 'thumbnail_url')
          String? thumbnailUrl}) {
    return _Apod(
      id: id,
      date: date,
      mediaType: mediaType,
      copyright: copyright,
      title: title,
      explanation: explanation,
      url: url,
      thumbnailUrl: thumbnailUrl,
    );
  }

  Apod fromJson(Map<String, Object?> json) {
    return Apod.fromJson(json);
  }
}

/// @nodoc
const $Apod = _$ApodTearOff();

/// @nodoc
mixin _$Apod {
  String get id => throw _privateConstructorUsedError;

  /// Date the APOD was published, not when the photo or video was taken
  DateTime? get date => throw _privateConstructorUsedError;

  /// Specify if the APOD an image or video
  /// Defaults to image, as a strong majority of apods are images
  @JsonKey(name: 'media_type')
  @MediaTypeConverter()
  MediaType get mediaType => throw _privateConstructorUsedError;

  /// Copyright owner(s) of the image or video. Only present in API if it is
  /// not in the public domain. Default value of 'Public domain'
  String get copyright => throw _privateConstructorUsedError;

  /// Title of the image or video
  String get title => throw _privateConstructorUsedError;

  /// Prose text with an explanation of the image or video
  String get explanation => throw _privateConstructorUsedError;

  /// The raw URL returned from the API.
  String get url => throw _privateConstructorUsedError;

  /// Thumbnail URL. Null if it is an image.
  @JsonKey(name: 'thumbnail_url')
  String? get thumbnailUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApodCopyWith<Apod> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApodCopyWith<$Res> {
  factory $ApodCopyWith(Apod value, $Res Function(Apod) then) =
      _$ApodCopyWithImpl<$Res>;
  $Res call(
      {String id,
      DateTime? date,
      @JsonKey(name: 'media_type') @MediaTypeConverter() MediaType mediaType,
      String copyright,
      String title,
      String explanation,
      String url,
      @JsonKey(name: 'thumbnail_url') String? thumbnailUrl});
}

/// @nodoc
class _$ApodCopyWithImpl<$Res> implements $ApodCopyWith<$Res> {
  _$ApodCopyWithImpl(this._value, this._then);

  final Apod _value;
  // ignore: unused_field
  final $Res Function(Apod) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? mediaType = freezed,
    Object? copyright = freezed,
    Object? title = freezed,
    Object? explanation = freezed,
    Object? url = freezed,
    Object? thumbnailUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mediaType: mediaType == freezed
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
      copyright: copyright == freezed
          ? _value.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: explanation == freezed
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: thumbnailUrl == freezed
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ApodCopyWith<$Res> implements $ApodCopyWith<$Res> {
  factory _$ApodCopyWith(_Apod value, $Res Function(_Apod) then) =
      __$ApodCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      DateTime? date,
      @JsonKey(name: 'media_type') @MediaTypeConverter() MediaType mediaType,
      String copyright,
      String title,
      String explanation,
      String url,
      @JsonKey(name: 'thumbnail_url') String? thumbnailUrl});
}

/// @nodoc
class __$ApodCopyWithImpl<$Res> extends _$ApodCopyWithImpl<$Res>
    implements _$ApodCopyWith<$Res> {
  __$ApodCopyWithImpl(_Apod _value, $Res Function(_Apod) _then)
      : super(_value, (v) => _then(v as _Apod));

  @override
  _Apod get _value => super._value as _Apod;

  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? mediaType = freezed,
    Object? copyright = freezed,
    Object? title = freezed,
    Object? explanation = freezed,
    Object? url = freezed,
    Object? thumbnailUrl = freezed,
  }) {
    return _then(_Apod(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mediaType: mediaType == freezed
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
      copyright: copyright == freezed
          ? _value.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: explanation == freezed
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: thumbnailUrl == freezed
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Apod extends _Apod {
  const _$_Apod(
      {required this.id,
      this.date,
      @JsonKey(name: 'media_type')
      @MediaTypeConverter()
          this.mediaType = MediaType.image,
      this.copyright = 'Public Domain',
      this.title = '',
      this.explanation = '',
      this.url = '',
      @JsonKey(name: 'thumbnail_url')
          this.thumbnailUrl})
      : super._();

  factory _$_Apod.fromJson(Map<String, dynamic> json) => _$$_ApodFromJson(json);

  @override
  final String id;
  @override

  /// Date the APOD was published, not when the photo or video was taken
  final DateTime? date;
  @override

  /// Specify if the APOD an image or video
  /// Defaults to image, as a strong majority of apods are images
  @JsonKey(name: 'media_type')
  @MediaTypeConverter()
  final MediaType mediaType;
  @JsonKey(defaultValue: 'Public Domain')
  @override

  /// Copyright owner(s) of the image or video. Only present in API if it is
  /// not in the public domain. Default value of 'Public domain'
  final String copyright;
  @JsonKey(defaultValue: '')
  @override

  /// Title of the image or video
  final String title;
  @JsonKey(defaultValue: '')
  @override

  /// Prose text with an explanation of the image or video
  final String explanation;
  @JsonKey(defaultValue: '')
  @override

  /// The raw URL returned from the API.
  final String url;
  @override

  /// Thumbnail URL. Null if it is an image.
  @JsonKey(name: 'thumbnail_url')
  final String? thumbnailUrl;

  @override
  String toString() {
    return 'Apod(id: $id, date: $date, mediaType: $mediaType, copyright: $copyright, title: $title, explanation: $explanation, url: $url, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Apod &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.copyright, copyright) ||
                other.copyright == copyright) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, date, mediaType, copyright,
      title, explanation, url, thumbnailUrl);

  @JsonKey(ignore: true)
  @override
  _$ApodCopyWith<_Apod> get copyWith =>
      __$ApodCopyWithImpl<_Apod>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApodToJson(this);
  }
}

abstract class _Apod extends Apod {
  const factory _Apod(
      {required String id,
      DateTime? date,
      @JsonKey(name: 'media_type') @MediaTypeConverter() MediaType mediaType,
      String copyright,
      String title,
      String explanation,
      String url,
      @JsonKey(name: 'thumbnail_url') String? thumbnailUrl}) = _$_Apod;
  const _Apod._() : super._();

  factory _Apod.fromJson(Map<String, dynamic> json) = _$_Apod.fromJson;

  @override
  String get id;
  @override

  /// Date the APOD was published, not when the photo or video was taken
  DateTime? get date;
  @override

  /// Specify if the APOD an image or video
  /// Defaults to image, as a strong majority of apods are images
  @JsonKey(name: 'media_type')
  @MediaTypeConverter()
  MediaType get mediaType;
  @override

  /// Copyright owner(s) of the image or video. Only present in API if it is
  /// not in the public domain. Default value of 'Public domain'
  String get copyright;
  @override

  /// Title of the image or video
  String get title;
  @override

  /// Prose text with an explanation of the image or video
  String get explanation;
  @override

  /// The raw URL returned from the API.
  String get url;
  @override

  /// Thumbnail URL. Null if it is an image.
  @JsonKey(name: 'thumbnail_url')
  String? get thumbnailUrl;
  @override
  @JsonKey(ignore: true)
  _$ApodCopyWith<_Apod> get copyWith => throw _privateConstructorUsedError;
}
