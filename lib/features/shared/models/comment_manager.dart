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

  void subscribeToCommentsForApod(String apodId) async {
    // First, any locally available comments.
    final cachedComments = (await _repository.getItems(type: RequestType.local))
        .where((Comment comment) => comment.apodId == apodId)
        .toList();

    // Immediately update the UI with locally known comments.
    _updateComments(cachedComments);

    final Comment? mostRecentComment =
        state.comments != null && state.comments!.isNotEmpty
            ? state.comments!.first
            : null;

    _commentSubscription = _repository.subscribeTo([
      WhereClause.equals(fieldName: 'apodId', value: apodId),
      if (mostRecentComment != null)
        WhereClause.greaterThan(
          fieldName: 'createdAt',
          value: mostRecentComment.createdAt.toIso8601String(),
        ),
    ]).listen(_updateComments);
  }

  /// Closes the subscription for new comments on a given [Apod]. Call this when
  /// leaving a page that requires such a subscription.
  void unsubscribeToCommentsForApod() => _commentSubscription?.cancel();

  void _updateComments(List<Comment> comments) {
    // Grab all previous comments, as a Set
    final previousComments = state.comments?.toSet() ?? <Comment>{};
    // Add to those any new comments
    final allComments = previousComments..addAll(comments.toSet());
    // And update the state
    state = state.copyWith(
      comments: allComments.toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt)),
    );
  }
}
