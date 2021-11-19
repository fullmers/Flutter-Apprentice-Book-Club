import 'package:apod/features/shared/blocs/apod/apod.dart';
import 'package:apod/features/shared/models/apod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ApodDetail extends StatefulWidget {
  final String id;

  const ApodDetail({Key? key, required this.id}) : super(key: key);

  static Page page({
    required String id,
    LocalKey? key,
  }) =>
      MaterialPage<void>(
        key: key,
        child: ApodDetail(id: id),
      );

  @override
  _ApodDetailState createState() {
    return _ApodDetailState();
  }
}

class _ApodDetailState extends State<ApodDetail> {
  double _sliderScalar = 1.0;
  final TransformationController _controller = TransformationController();
  late ApodBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<ApodBloc>();
    bloc.add(LoadSpecificApod(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ApodState>(
      stream: bloc.stream,
      builder: (BuildContext context, AsyncSnapshot<ApodState> snapshot) {
        // Catch the initial moment before our we've done anything.
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final Apod? apod = snapshot.data!.getApod(widget.id);

        if (apod == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          appBar: AppBar(
            title: (Text(apod.title)),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  child: _ApodImage(apod: apod, controller: _controller),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.4,
                  // 50 pixels is the size of the upper navbar. Subtracting
                  // this prevents the last part of our test from being
                  // unreachable below the bottom of the UI.
                  height: MediaQuery.of(context).size.height * 0.6 - 50,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      if (apod.mediaType == MediaType.image)
                        Slider(
                          min: 1.0,
                          max: 4.0,
                          divisions: 20,
                          label: _sliderScalar.toStringAsPrecision(2),
                          value: _sliderScalar.toDouble(),
                          onChanged: (newValue) {
                            setState(() {
                              _sliderScalar = newValue;
                              _controller.value =
                                  Matrix4.identity().scaled(_sliderScalar);
                            });
                          },
                          activeColor: Colors.purple[200],
                          inactiveColor: Colors.purple[800],
                        ),
                      _ApodBody(apod, scalar: _sliderScalar),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ApodImage extends StatelessWidget {
  const _ApodImage({
    Key? key,
    required this.apod,
    required TransformationController controller,
  })  : _controller = controller,
        super(key: key);
  final Apod apod;
  final TransformationController _controller;

  @override
  Widget build(BuildContext context) {
    if (apod.displayImageUrl != null) {
      if (apod.mediaType == MediaType.image) {
        return InteractiveViewer(
          transformationController: _controller,
          child: Image(
            image: CachedNetworkImageProvider(apod.displayImageUrl!),
            fit: BoxFit.fitWidth,
          ),
        );
      } else {
        return Stack(children: [
          Image(
            image: CachedNetworkImageProvider(apod.displayImageUrl!),
            fit: BoxFit.fitWidth,
          ),
          const Center(
            child: Icon(
              Icons.play_circle_outline,
              size: 72,
              color: Colors.white,
            ),
          )
        ]);
      }
    } else {
      return Container(
        color: Colors.black45,
        child: const Icon(
          Icons.play_circle_outline,
          size: 72,
          color: Colors.white,
        ),
      );
    }
  }
}

class _ApodBody extends StatelessWidget {
  const _ApodBody(this.apod, {required this.scalar});
  final Apod apod;
  final double scalar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                DateFormat('yyyy-MM-dd').format(apod.date!),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (apod.mediaType == MediaType.image)
                Chip(
                  backgroundColor: Colors.purple,
                  label: Text(
                    'Zoom: ${scalar.toStringAsPrecision(2)}',
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
            apod.title,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Copyright: ${apod.copyright}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            apod.explanation,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 72),
        ],
      ),
    );
  }
}
