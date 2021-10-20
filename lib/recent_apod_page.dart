import 'package:apod/apod.dart';
import 'package:apod/apod_card.dart';
import 'package:apod/apod_detail.dart';
import 'package:flutter/material.dart';

@immutable
class RecentApodPage extends StatelessWidget {
  const RecentApodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Apod.samples.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return (ApodDetail(apod: Apod.samples[index]));
            }));
          },
          child: Padding(
            padding: EdgeInsets.only(top: index == 0 ? 12 : 0, bottom: 12),
            child: ApodCard(Apod.samples[index]),
          ),
        );
      },
    );
  }
}
