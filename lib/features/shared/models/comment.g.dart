// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      id: json['id'] as String?,
      author: const UserConverter()
          .fromJson(json['author'] as Map<String, dynamic>),
      body: json['body'] as String,
      apodId: json['apodId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': const UserConverter().toJson(instance.author),
      'body': instance.body,
      'apodId': instance.apodId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
