import 'package:apod/features/shared/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@Freezed()
class Comment extends DataModel with _$Comment {
  const factory Comment({
    required String id,
    required User author,
    required String body,
    required DateTime createdAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
