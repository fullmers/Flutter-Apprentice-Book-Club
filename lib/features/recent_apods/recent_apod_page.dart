import 'package:apod/features/recent_apods/apod_card.dart';
import 'package:apod/features/shared/models/apod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../api/mock_apod_service.dart';

@immutable
class RecentApodPage extends StatelessWidget {
  const RecentApodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mockService = MockApodService();
    return FutureBuilder(
      future: mockService.getRecentApods(),
      builder: (context, AsyncSnapshot<List<Apod>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<Apod>? apods = snapshot.data;
          return (apods != null)
              ? ListView.builder(
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
