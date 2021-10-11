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
  double _fontScalar = 1.0;
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
          Slider(
            min: 1.0,
            max: 2.0,
            divisions: 10,
            label: '$_fontScalar',
            value: _fontScalar.toDouble(),
            onChanged: (newValue) {
              setState(() {
                _fontScalar = newValue;
              });
            },
            activeColor: Colors.purple[200],
            inactiveColor: Colors.purple[800],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('yyyy-MM-dd').format(widget.apod.date!),
                  style: TextStyle(
                    fontSize: 18 * _fontScalar,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.apod.title!,
                  style: TextStyle(
                    fontSize: 18 * _fontScalar,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Copyright: ${widget.apod.copyright!}',
                  style: TextStyle(
                    fontSize: 16 * _fontScalar,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.apod.explanation!,
                  style: TextStyle(
                    fontSize: 16 * _fontScalar,
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
