import 'package:apod/api/mock_apod_service.dart';
import 'package:apod/features/shared/models/apod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'full_screen_apod.dart';

class CurrentApodPage extends StatelessWidget {
  const CurrentApodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mockService = MockApodService();

    return FutureBuilder(
      future: mockService.getCurrentApod(),
      builder: (context, AsyncSnapshot<Apod> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return (snapshot.data == null && snapshot.data is Apod)
              ? const Text('Something went wrong')
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
