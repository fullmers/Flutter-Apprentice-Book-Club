import 'package:apod/bootstrap.dart';
import 'package:apod/features/home/home.dart';
import 'package:apod/features/shared/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CurrentApodPage extends ConsumerStatefulWidget {
  const CurrentApodPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _CurrentApodPageState();
}

class _CurrentApodPageState extends ConsumerState<CurrentApodPage> {
  @override
  void initState() {
    super.initState();
    ref.read(apodManagerProvider.notifier).getApod();
  }

  @override
  Widget build(BuildContext context) {
    final ApodState state = ref.watch(apodManagerProvider);
    if (state.primaryApod == null) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }

    final apod = state.primaryApod!;

    return GestureDetector(
      onTap: () {
        context.go('/apod/${apod.id}');
      },
      child: Center(
        child: FullScreenApod(apod),
      ),
    );
  }
}
