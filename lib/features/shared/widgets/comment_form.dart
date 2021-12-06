import 'package:apod/bootstrap.dart';
import 'package:apod/features/shared/models/models.dart';
import 'package:apod/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as og_provider;

class CommentForm extends ConsumerStatefulWidget {
  const CommentForm({Key? key, required this.apod}) : super(key: key);

  final Apod apod;

  @override
  ConsumerState<CommentForm> createState() => _CommentFormState();
}

class _CommentFormState extends ConsumerState<CommentForm> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _controller,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              ref.read(commentManagerProvider.notifier).saveComment(
                    Comment(
                      body: _controller.text,
                      apodId: widget.apod.id,
                      author: context.read<AppStateManager>().user!,
                      createdAt: DateTime.now().toUtc(),
                    ),
                  );
            },
          ),
        ],
      );
}
