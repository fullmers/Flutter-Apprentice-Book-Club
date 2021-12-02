import 'package:apod/features/shared/models/models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({Key? key, required this.comment}) : super(key: key);

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    final size = (comment.body.hashCode % 100) + 200;
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          maxRadius: 25,
          backgroundImage: CachedNetworkImageProvider(
            'https://picsum.photos/$size',
          ),
        ),
        title: Text(
          comment.body,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontWeight: FontWeight.w200),
        ),
        subtitle: Text(
          comment.createdAt.toLocal().toString(),
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: Colors.grey,
              ),
        ),
      ),
    );
  }
}
