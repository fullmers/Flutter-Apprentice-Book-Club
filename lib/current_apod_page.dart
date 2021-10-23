import 'package:flutter/material.dart';

import 'api/mock_apod_service.dart';
import 'apod.dart';
import 'apod_card.dart';
import 'apod_detail.dart';

class CurrentApodPage extends StatelessWidget {
  const CurrentApodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mockService = MockApodService();

    return FutureBuilder(
      future: mockService.getCurrentApod(),
      builder: (context, AsyncSnapshot<Apod> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return (snapshot.data == null)
              ? const Text('Something went wrong')
              : GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return (ApodDetail(apod: snapshot.data!));
                      }),
                    );
                  },
                  child: Center(
                    child: ApodCard(snapshot.data!),
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
