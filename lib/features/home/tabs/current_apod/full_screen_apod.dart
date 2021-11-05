import 'package:apod/apod_theme.dart';
import 'package:apod/features/shared/models/apod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FullScreenApod extends StatelessWidget {
  final Apod apod;
  const FullScreenApod(this.apod, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(apod.displayImageUrl!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          constraints: const BoxConstraints.expand(height: 110),
          decoration: const BoxDecoration(
            color: Colors.black87,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Consider the case of many copyright holders or long titles (long text).
                // Instead of wrapping, we choose to end the single line with an
                // ellipsis. The user can click on the card to read the full text.
                Text(
                  apod.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: ApodTheme.darkTextTheme.headline1,
                ),
                Text(
                  apod.copyright,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: ApodTheme.darkTextTheme.subtitle1,
                ),
                Text(
                  DateFormat('yyyy-MM-dd').format(apod.date!),
                  style: ApodTheme.darkTextTheme.subtitle2,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
