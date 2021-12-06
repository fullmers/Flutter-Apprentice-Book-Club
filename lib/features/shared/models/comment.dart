// ignore_for_file: invalid_annotation_target
import 'package:apod/features/shared/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@Freezed()
class Comment extends DataModel with _$Comment {
  @JsonSerializable(explicitToJson: true)
  const factory Comment({
    String? id,
    @UserConverter() required User author,
    required String body,
    required String apodId,
    required DateTime createdAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
