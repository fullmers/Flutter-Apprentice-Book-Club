import 'package:apod/features/home/home.dart';
import 'package:provider/provider.dart';

import 'package:apod/features/shared/models/apod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

@immutable
class RecentApodPage extends StatefulWidget {
  const RecentApodPage({Key? key}) : super(key: key);

  @override
  State<RecentApodPage> createState() => _RecentApodPageState();
}

class _RecentApodPageState extends State<RecentApodPage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final manager = context.read<FavoritesManager>();
    return FutureBuilder(
      future: manager.getRecentApods(),
      builder: (context, AsyncSnapshot<List<Apod>?> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<Apod>? apods = snapshot.data;
          return (apods != null)
              ? ListView.builder(
                  controller: _controller,
                  itemCount: apods.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        context.go('/apod/${apods[index].id}');
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: index == 0 ? 12 : 0, bottom: 12),
                        child: ApodCard(apods[index]),
                      ),
                    );
                  },
                )
              : const Text('Something went wrong loading the data.');
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
