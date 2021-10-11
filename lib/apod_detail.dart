import 'package:apod/apod.dart';
import 'package:flutter/cupertino.dart';

class ApodDetail extends StatefulWidget {
  final Apod apod;

  const ApodDetail({Key? key, required this.apod}) : super(key: key);

  @override
  _ApodDetailState createState() {
    return _ApodDetailState();
  }
}

class _ApodDetailState extends State<ApodDetail> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.apod.title!);
  }
}
