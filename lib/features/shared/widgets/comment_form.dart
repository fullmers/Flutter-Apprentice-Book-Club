import 'package:flutter/material.dart';

class CommentForm extends StatelessWidget {
  const CommentForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          const Expanded(child: TextField()),
          IconButton(icon: const Icon(Icons.send), onPressed: () {}),
        ],
      );
}
