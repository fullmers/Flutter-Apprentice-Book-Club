import 'package:apod/bootstrap.dart';
import 'package:apod/features/shared/extensions.dart';
import 'package:apod/features/shared/models/models.dart';
import 'package:apod/features/shared/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ApodDetail extends ConsumerStatefulWidget {
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
  _ApodDetailState createState() => _ApodDetailState();
}

class _ApodDetailState extends ConsumerState<ApodDetail>
    with SingleTickerProviderStateMixin {
  double _sliderScalar = 1.0;
  final TransformationController _controller = TransformationController();
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    ref
        .read(apodManagerProvider.notifier)
        .getApod(widget.id.toDateTimeAsDateString());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(apodManagerProvider);
    if (state.primaryApod == null || state.primaryApod!.id != widget.id) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator.adaptive()),
      );
    }
    final apod = state.primaryApod!;
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
              child: _getImage(apod),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.4,
              // 50 pixels is the size of the upper navbar. Subtracting
              // this prevents the last part of our test from being
              // unreachable below the bottom of the UI.
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              child: TabBar(
                controller: _tabController,
                tabs: <Widget>[
                  Text(
                    'Info',
                    style: TextStyle(
                        color: _tabController.index == 0
                            ? Colors.white
                            : Colors.black),
                  ),
                  Text(
                    'Comments',
                    style: TextStyle(
                        color: _tabController.index == 1
                            ? Colors.white
                            : Colors.black),
                  ),
                ],
                indicator: ContainerTabIndicator(
                  widthFraction: 0.5,
                  heightFraction: 0.4,
                  radius: BorderRadius.circular(8.0),
                  color: Colors.purple,
                  borderColor: Colors.black,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.5,
              height: MediaQuery.of(context).size.height * 0.5 - 50,
              width: MediaQuery.of(context).size.width,
              child: _tabController.index == 0
                  ? _getInfo(apod)
                  : const _ApodComments(),
            )
          ],
        ),
      ),
    );
  }

  Widget _getInfo(Apod apod) {
    return ListView(
      children: [
        _ApodSlider(
          sliderScalar: _sliderScalar,
          apod: apod,
          onChanged: (newValue) {
            setState(() {
              _sliderScalar = newValue;
              _controller.value = Matrix4.identity().scaled(_sliderScalar);
            });
          },
        ),
        _ApodBody(apod, scalar: _sliderScalar),
      ],
    );
  }

  /// show either an apod image, an apod video thumb with play button, or a gray
  /// box with a play button (if no thumbnail was available)
  Widget _getImage(Apod apod) {
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

class _ApodComments extends StatelessWidget {
  const _ApodComments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListView(
        children: <Widget>[
          /// Obviously fake. TODO: Load this from Cloud Firestore!
          CommentCard(
            comment: Comment(
              id: 'abc',
              apodId: '2022-01-01',
              author: const User(id: '123', email: 'some@email.com'),
              body: 'This is a comment!',
              createdAt: DateTime.now()..toUtc(),
            ),
          ),
          const CommentForm()
        ],
      ),
    );
  }
}

class _ApodSlider extends StatelessWidget {
  const _ApodSlider({
    Key? key,
    required this.sliderScalar,
    required this.apod,
    required this.onChanged,
  }) : super(key: key);

  final Apod apod;
  final double sliderScalar;
  final Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return (apod.mediaType == MediaType.image)
        ? Slider(
            min: 1.0,
            max: 4.0,
            divisions: 20,
            label: sliderScalar.toStringAsPrecision(2),
            value: sliderScalar.toDouble(),
            onChanged: onChanged,
            activeColor: Colors.purple[200],
            inactiveColor: Colors.purple[800],
          )
        : Container();
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
