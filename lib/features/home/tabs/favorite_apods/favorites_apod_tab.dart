import 'package:apod/bootstrap.dart';
import 'package:apod/features/home/tabs/favorite_apods/favorite_apods.dart';
import 'package:apod/features/shared/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavoritesApodPage extends ConsumerStatefulWidget {
  const FavoritesApodPage({Key? key}) : super(key: key);

  @override
  ConsumerState<FavoritesApodPage> createState() => _FavoritesApodPageState();
}

class _FavoritesApodPageState extends ConsumerState<FavoritesApodPage> {
  @override
  void initState() {
    super.initState();
    ref.read(apodManagerProvider.notifier).getFavoriteApods();
  }

  @override
  Widget build(BuildContext context) {
    final ApodState state = ref.watch(apodManagerProvider);
    if (state.favoriteApods.isEmpty) {
      return const Center(child: Text('No favorites yet'));
    }

    final favorites = state.favoriteApods..sort((a, b) => b.id.compareTo(a.id));

    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: favorites.length,
      itemBuilder: (BuildContext context, int index) => SizedBox(
        child: GestureDetector(
          onTap: () async {
            context.go('/apod/${favorites[index].id}');
          },
          child: ApodThumbnail(favorites[index]),
        ),
      ),
    );
  }
}
