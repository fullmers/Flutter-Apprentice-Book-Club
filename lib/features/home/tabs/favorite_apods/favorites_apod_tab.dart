import 'package:apod/api/mock_apod_service.dart';
import 'package:apod/features/home/tabs/favorite_apods/favorite_apods.dart';
import 'package:apod/features/shared/models/apod.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesApodPage extends StatelessWidget {
  const FavoritesApodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final apodService = MockApodService();
    return Consumer<FavoritesManager>(
      builder: (context, favoritesManager, child) {
        return FutureBuilder(
          future: apodService.getFavoriteApods(
            favoritesManager.favoriteIds.toList(),
          ),
          builder: (context, AsyncSnapshot<List<Apod>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final numFavorites = snapshot.data?.length ?? 0;
              return numFavorites > 0
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: numFavorites,
                      itemBuilder: (BuildContext context, int index) =>
                          SizedBox(child: ApodThumbnail(snapshot.data![index])),
                    )
                  : const Center(
                      child: Text('No favorites yet!'),
                    );
            } else {
              // 6
              return const Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }
}
