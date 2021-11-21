import 'package:apod/bootstrap.dart';
import 'package:apod/features/home/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

@immutable
class RecentApodPage extends ConsumerStatefulWidget {
  const RecentApodPage({Key? key}) : super(key: key);

  @override
  ConsumerState<RecentApodPage> createState() => _RecentApodPageState();
}

class _RecentApodPageState extends ConsumerState<RecentApodPage> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    ref.read(apodManagerProvider.notifier).getRecentApods();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(apodManagerProvider);
    if (state.apods.isEmpty) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }
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
  }
}
