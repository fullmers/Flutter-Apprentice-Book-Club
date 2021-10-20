import 'package:flutter/material.dart';

import 'apod.dart';
import 'apod_card.dart';
import 'apod_detail.dart';

class CurrentApodPage extends StatelessWidget {
  const CurrentApodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return (ApodDetail(apod: Apod.samples[0]));
        }));
      },
      child: Center(
        child: ApodCard(Apod.samples[0]),
      ),
    );
  }
}
