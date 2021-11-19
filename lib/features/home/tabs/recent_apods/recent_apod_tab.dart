import 'package:apod/features/home/home.dart';
import 'package:apod/features/shared/blocs/apod/apod.dart';
import 'package:provider/provider.dart';

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
  late ApodBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<ApodBloc>();
    bloc.add(const LoadRecentApods());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.stream,
      builder: (context, AsyncSnapshot<ApodState> snapshot) {
        // Catch the initial moment before our we've done anything.
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        // Now pull out the state.
        final ApodState state = snapshot.data!;
        if (state.apods.isEmpty) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        // Finally, return the actual UI.
        return ListView.builder(
          controller: _controller,
          itemCount: state.apods.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                context.go('/apod/${state.apods[index].id}');
              },
              child: Padding(
                padding: EdgeInsets.only(top: index == 0 ? 12 : 0, bottom: 12),
                child: ApodCard(state.apods[index]),
              ),
            );
          },
        );
      },
    );
  }
}
