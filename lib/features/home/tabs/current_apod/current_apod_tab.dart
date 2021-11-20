import 'package:apod/features/home/home.dart';
import 'package:apod/features/shared/blocs/apod/apod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CurrentApodPage extends StatefulWidget {
  const CurrentApodPage({Key? key}) : super(key: key);

  @override
  State<CurrentApodPage> createState() => _CurrentApodPageState();
}

class _CurrentApodPageState extends State<CurrentApodPage> {
  @override
  void initState() {
    super.initState();
    context.read<ApodBloc>().add(const LoadTodaysApod());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApodBloc, ApodState>(
      // Optional, but `flutter_bloc` can figure it out.
      // bloc: context.read<ApodBloc>(),
      builder: (BuildContext context, ApodState state) {
        if (state.primaryApod == null) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        // Finally, return the actual UI.
        return GestureDetector(
          onTap: () {
            context.go('/apod/${state.primaryApod!.id}');
          },
          child: Center(
            child: FullScreenApod(state.primaryApod!),
          ),
        );
      },
    );
  }
}
