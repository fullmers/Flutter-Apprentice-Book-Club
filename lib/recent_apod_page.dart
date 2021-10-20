import 'package:apod/apod.dart';
import 'package:apod/apod_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

@immutable
class RecentApodPage extends StatelessWidget {
  const RecentApodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Apod.samples.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return (ApodDetail(apod: Apod.samples[index]));
              }));
            },
            child: _buildApodCard(Apod.samples[index]));
      },
    );
  }

  Widget _buildApodCard(Apod apod) {
    final String imageToShow =
        apod.mediaType == MediaType.image ? apod.url! : apod.thumb!;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage(imageToShow),
            ),
          ),
          Text(
            DateFormat('yyyy-MM-dd').format(apod.date!),
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          Text(
            apod.title!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
