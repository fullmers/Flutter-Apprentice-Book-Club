import 'dart:async';

import 'package:apod/features/shared/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentManager extends StateNotifier<CommentState> {
  /// Public constructor which accepts a `Repository<Comment>` instance.
  CommentManager(CommentRepository repository)
      : _repository = repository,
        super(CommentState.initial());

  final CommentRepository _repository;
  StreamSubscription? _commentSubscription;

  Future<void> saveComment(Comment comment) async =>
      _repository.setItem(comment);

  void subscribeToCommentsForApod(String apodId) {
    _commentSubscription = _repository
        .subscribeTo(
          WhereClause.equals(fieldName: 'apodId', value: apodId),
        )
        .listen(_updateComments);
  }

  void _updateComments(List<Comment> comments) {
    state = state.copyWith(
      comments: comments..sort((a, b) => b.id!.compareTo(a.id!)),
    );
  }

  @override
  void dispose() {
    _commentSubscription?.cancel();
    super.dispose();
  }
}
