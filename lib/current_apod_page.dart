import 'package:flutter/material.dart';

import 'api/mock_apod_service.dart';
import 'apod.dart';
import 'apod_card.dart';
import 'apod_detail.dart';

class CurrentApodPage extends StatelessWidget {
  const CurrentApodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return (ApodDetail(apod: Apod.samples[0]));
        }));
      },
      child: Center(
        child: _buildApodCard(), //ApodCard(Apod.samples[0]),
      ),
    );
  }

  Widget _buildApodCard() {
    // 1
    final mockService = MockApodService();

    return FutureBuilder(
      // 2
      future: mockService.getCurrentApod(),
      // 3
      builder: (context, AsyncSnapshot<Apod> snapshot) {
        // TODO: Add Nested List Views
        // 4
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            child: (snapshot.data == null)
                ? Text('oops')
                : ApodCard(snapshot.data!),
          );
        } else {
          // 6
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
