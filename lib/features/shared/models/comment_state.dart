import 'package:apod/features/shared/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_state.freezed.dart';

@Freezed()
class CommentState with _$CommentState {
  const factory CommentState({
    List<Comment>? comments,
  }) = _CommentState;

  factory CommentState.initial() => const CommentState();
}
