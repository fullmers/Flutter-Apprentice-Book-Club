import 'package:apod/features/home/home.dart';
import 'package:apod/features/shared/blocs/apod/apod.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  void initState() {
    super.initState();
    context.read<ApodBloc>().add(const LoadRecentApods());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApodBloc, ApodState>(
      // Optional, but `flutter_bloc` can figure it out.
      // bloc: context.read<ApodBloc>(),
      builder: (BuildContext context, ApodState state) {
        if (state.apods.isEmpty) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        final apods = state.apods..sort((a, b) => b.id.compareTo(a.id));

        // Finally, return the actual UI.
        return ListView.builder(
          controller: _controller,
          itemCount: apods.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                context.go('/apod/${apods[index].id}');
              },
              child: Padding(
                padding: EdgeInsets.only(top: index == 0 ? 12 : 0, bottom: 12),
                child: ApodCard(apods[index]),
              ),
            );
          },
        );
      },
    );
  }
}
