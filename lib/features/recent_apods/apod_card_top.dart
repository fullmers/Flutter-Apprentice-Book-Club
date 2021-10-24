import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../apod_theme.dart';
import 'apod_card.dart';

@immutable
class ApodCardTop extends StatelessWidget {
  const ApodCardTop({
    required this.date,
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    // Since the pictures are not always dark, we add a dark semi-transparent
    // background to the title and date text, to make it readable in all cases
    return Container(
      height: 60,
      constraints: const BoxConstraints.expand(width: cardWidth, height: 72),
      decoration: const BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(cardRadius),
          topRight: Radius.circular(cardRadius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: cardPadding,
          top: cardPadding,
          right: cardPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Consider the case of a very long title. Instead of wrapping, we
            // choose to end the single line with an ellipsis. The user can
            // click on the card to read the full text.
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              style: ApodTheme.darkTextTheme.headline2,
            ),
            Text(
              DateFormat('yyyy-MM-dd').format(date),
              style: ApodTheme.darkTextTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
