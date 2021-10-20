import 'package:flutter/material.dart';
import 'apod.dart';
import 'apod_card.dart';

class CurrentApodPage extends StatelessWidget {
  const CurrentApodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ApodCard(Apod.samples[0]),
    );
  }
}
