import 'package:apod/features/home/home.dart';
import 'package:apod/features/shared/models/apod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CurrentApodPage extends StatelessWidget {
  const CurrentApodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final manager = context.read<FavoritesManager>();
    return FutureBuilder<Apod?>(
      future: manager.getApod(),
      builder: (context, AsyncSnapshot<Apod?> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return (snapshot.data == null)
              ? const Center(child: Text('Something went wrong'))
              : GestureDetector(
                  onTap: () {
                    context.go('/apod/${snapshot.data!.id}');
                  },
                  child: Center(
                    child: FullScreenApod(snapshot.data!),
                  ),
                );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
