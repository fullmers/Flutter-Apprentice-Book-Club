import 'package:flutter/material.dart';

import '../../apod_theme.dart';
import 'apod_card.dart';

@immutable
class ApodCardBottom extends StatelessWidget {
  const ApodCardBottom({
    required this.copyright,
    Key? key,
  }) : super(key: key);

  final String copyright;

  @override
  Widget build(BuildContext context) {
    // Since the pictures are not always dark, we add a dark semi-transparent
    // background to the title and date text, to make it readable in all cases
    return Container(
      height: 60,
      constraints: const BoxConstraints.expand(width: cardWidth, height: 44),
      decoration: const BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(cardRadius),
          bottomRight: Radius.circular(cardRadius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: cardPadding,
          top: cardPadding,
          right: cardPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Consider the case of many copyright holders (long text). Instead
            // of wrapping, we choose to end the single line with an ellipsis.
            // The user can click on the card to read the full text.
            Text(
              copyright,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              style: ApodTheme.darkTextTheme.bodyText1,
            )
          ],
        ),
      ),
    );
  }
}
