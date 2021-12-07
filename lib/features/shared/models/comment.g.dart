// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      id: json['id'] as String?,
      author: const AuthorConverter().fromJson(json['author'] as Map),
      body: json['body'] as String,
      apodId: json['apodId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': const AuthorConverter().toJson(instance.author),
      'body': instance.body,
      'apodId': instance.apodId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
