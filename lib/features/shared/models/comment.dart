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
    @AuthorConverter() required User author,
    required String body,
    required String apodId,
    required DateTime createdAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

/// Converts a [User] object to and from JSON.
///
/// [AuthorConverter] is necessary for handling a [Comment]'s `author` because
/// nested maps in a <String, dynamic> map are not also <String, dynamic>, but
/// instead, just <dynamic, dynamic>.
///
/// Thus, this special [User] converter exists to call `.cast<String, dynamic>()`
/// before the generated code type-checks the data with `as Map<String, dynamic>`.
class AuthorConverter implements JsonConverter<User, Map> {
  const AuthorConverter();
  @override
  User fromJson(Map json) => User.fromJson(json.cast<String, dynamic>());

  @override
  Map toJson(User object) => object.toJson().cast<String, dynamic>();
}
