import 'package:apod/features/home/tabs/favorite_apods/favorite_apods.dart';
import 'package:apod/features/shared/models/apod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'apod_card_bottom.dart';
import 'apod_card_top.dart';

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
          apod.mediaType == MediaType.image
              ? _buildImagePicture()
              : _buildVideoPicture(),
          ApodCardTop(
            title: apod.title,
            date: apod.date!,
          ),
          Positioned(
            bottom: 0,
            child: ApodCardBottom(copyright: apod.copyright),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: GestureDetector(
              onTap: () {
                context.read<FavoritesManager>().toggleFavorite(apod.id);
              },
              child: Consumer<FavoritesManager>(
                builder: (context, favoritesManager, child) {
                  return FutureBuilder<bool>(
                    future: favoritesManager.isFavorited(apod.id),
                    builder: (context, AsyncSnapshot<bool> snapshot) {
                      final isSelected =
                          !snapshot.hasData ? false : snapshot.data!;
                      final color = isSelected ? Colors.red[900] : Colors.white;
                      return Icon(Icons.favorite, color: color);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePicture() {
    return Container(
      constraints: const BoxConstraints.expand(
        width: cardWidth,
        height: cardHeight,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(apod.displayImageUrl!),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(cardRadius),
        ),
      ),
    );
  }

  Widget _buildVideoPicture() {
    return Container(
      constraints: const BoxConstraints.expand(
        width: cardWidth,
        height: cardHeight,
      ),
      // Show the thumbnail image if it is available, a gray box if it is not
      //todo The gray box should be replaced by something more interesting
      decoration: apod.displayImageUrl != null
          ? BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(apod.displayImageUrl!),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(cardRadius),
              ),
            )
          : const BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.all(
                Radius.circular(cardRadius),
              ),
            ),
      // show a play icon on top of the thumbnail image to indicate that it is
      // a video
      child: const Icon(
        Icons.play_circle_outline,
        size: 72,
        color: Colors.white,
      ),
    );
  }
}
