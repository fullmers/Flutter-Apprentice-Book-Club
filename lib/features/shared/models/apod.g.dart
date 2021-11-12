// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Apod _$$_ApodFromJson(Map<String, dynamic> json) => _$_Apod(
      id: json['id'] as String,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      mediaType: json['media_type'] == null
          ? MediaType.image
          : const MediaTypeConverter().fromJson(json['media_type'] as String),
      copyright: json['copyright'] as String? ?? 'Public Domain',
      title: json['title'] as String? ?? '',
      explanation: json['explanation'] as String? ?? '',
      url: json['url'] as String? ?? '',
      thumbnailUrl: json['thumbnail_url'] as String?,
    );

Map<String, dynamic> _$$_ApodToJson(_$_Apod instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date?.toIso8601String(),
      'media_type': const MediaTypeConverter().toJson(instance.mediaType),
      'copyright': instance.copyright,
      'title': instance.title,
      'explanation': instance.explanation,
      'url': instance.url,
      'thumbnail_url': instance.thumbnailUrl,
    };
