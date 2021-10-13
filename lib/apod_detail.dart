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
  double _sliderScalar = 1.0;
  final TransformationController _controller = TransformationController();

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
            child: InteractiveViewer(
              transformationController: _controller,
              child: Image(
                image: AssetImage(widget.apod.url!),
              ),
            ),
          ),
          Slider(
            min: 1.0,
            max: 4.0,
            divisions: 20,
            label: _sliderScalar.toStringAsPrecision(2),
            value: _sliderScalar.toDouble(),
            onChanged: (newValue) {
              setState(() {
                _sliderScalar = newValue;
                _controller.value = Matrix4.identity().scaled(_sliderScalar);
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      DateFormat('yyyy-MM-dd').format(widget.apod.date!),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Chip(
                      backgroundColor: Colors.purple,
                      label: Text(
                        'Zoom: ${_sliderScalar.toStringAsPrecision(2)}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
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
  }
}
