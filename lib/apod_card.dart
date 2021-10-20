import 'package:apod/apod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'apod_theme.dart';

const cardWidth = 350.0;
const cardHeight = 450.0;
const cardRadius = 10.0;
const cardPadding = 16.0;

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
      child: Stack(
        children: [
          _buildPicture(),
          _buildTopOverlay(),
          Positioned(
            bottom: 0,
            child: _buildBottomOverlay(),
          ),
        ],
      ),
    );
  }

  Widget _buildPicture() {
    return Container(
      constraints: const BoxConstraints.expand(
        width: cardWidth,
        height: cardHeight,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(apod.url!),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(cardRadius),
        ),
      ),
    );
  }

  Widget _buildTopOverlay() {
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
              apod.title ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              style: ApodTheme.darkTextTheme.headline2,
            ),
            if (apod.date != null)
              Text(
                DateFormat('yyyy-MM-dd').format(apod.date!),
                style: ApodTheme.darkTextTheme.bodyText1,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomOverlay() {
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
              apod.copyright ?? '',
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
