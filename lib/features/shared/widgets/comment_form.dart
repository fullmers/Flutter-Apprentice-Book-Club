import 'package:flutter/material.dart';

class CommentForm extends StatelessWidget {
  const CommentForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Expanded(child: TextField()),
          IconButton(icon: Icon(Icons.send), onPressed: () {}),
        ],
      );
}
