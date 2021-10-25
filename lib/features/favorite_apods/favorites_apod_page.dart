import 'package:apod/api/mock_apod_service.dart';
import 'package:apod/features/favorite_apods/apod_thumbnail.dart';
import 'package:apod/features/shared/models/apod.dart';
import 'package:flutter/material.dart';

class FavoritesApodPage extends StatelessWidget {
  const FavoritesApodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final apodService = MockApodService();
    return FutureBuilder(
      future: apodService.getFavoriteApods(),
      builder: (context, AsyncSnapshot<List<Apod>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) =>
                SizedBox(child: ApodThumbnail(snapshot.data![index])),
          );
        } else {
          // 6
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
