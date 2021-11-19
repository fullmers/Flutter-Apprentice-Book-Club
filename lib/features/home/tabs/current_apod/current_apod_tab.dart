import 'package:apod/features/home/home.dart';
import 'package:apod/features/shared/blocs/apod/apod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CurrentApodPage extends StatefulWidget {
  const CurrentApodPage({Key? key}) : super(key: key);

  @override
  State<CurrentApodPage> createState() => _CurrentApodPageState();
}

class _CurrentApodPageState extends State<CurrentApodPage> {
  late ApodBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<ApodBloc>();
    bloc.add(LoadTodaysApod());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ApodState>(
      stream: bloc.stream,
      builder: (BuildContext context, AsyncSnapshot<ApodState> snapshot) {
        // Catch the initial moment before our we've done anything.
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        // Now pull out the state.
        final ApodState state = snapshot.data!;
        if (state.todaysApod == null) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        // Finally, return the actual UI.
        return GestureDetector(
          onTap: () {
            context.go('/apod/${state.todaysApod!.id}');
          },
          child: Center(
            child: FullScreenApod(state.todaysApod!),
          ),
        );
      },
    );
  }
}
