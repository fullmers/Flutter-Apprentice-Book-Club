import 'package:apod/apod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'apod_theme.dart';

@immutable
class ApodCard extends StatelessWidget {
  const ApodCard(
    this.apod, {
    Key? key,
  }) : super(key: key);

  final Apod apod;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(apod.url!),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  apod.title ?? '',
                  style: ApodTheme.darkTextTheme.headline2,
                ),
                apod.date != null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          DateFormat('yyyy-MM-dd').format(apod.date!),
                          style: ApodTheme.darkTextTheme.bodyText1,
                        ),
                      )
                    : Container(),
              ],
            ),
            Positioned(
              bottom: 12,
              right: 0,
              child: Text(
                apod.copyright ?? '',
                style: ApodTheme.darkTextTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
