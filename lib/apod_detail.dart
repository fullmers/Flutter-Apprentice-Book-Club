import 'package:apod/apod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: (Text(widget.apod.title!)),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image(
              image: AssetImage(widget.apod.url!),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('yyyy-MM-dd').format(widget.apod.date!),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.apod.title!,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Copyright: ${widget.apod.copyright!}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.apod.explanation!,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
//    return Text(widget.apod.title!);
  }
}
