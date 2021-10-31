import 'package:apod/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmptyJournalView extends StatelessWidget {
  const EmptyJournalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        SizedBox(height: size.height / 30),
        SizedBox(
          height: size.width / 2,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.asset('assets/images/clipboards.png'),
          ),
        ),
        SizedBox(height: size.height / 30),
        Text(
          'No Journal Entries',
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: size.height / 30),
        Text(
          'Tap the Edit button to create one!',
          style: Theme.of(context).textTheme.bodyText2,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: size.height / 30),
        Center(
          child: MaterialButton(
            onPressed: () =>
                Provider.of<AppStateManager>(context, listen: false)
                    .goToRecentApods(),
            padding: const EdgeInsets.all(20.0),
            textColor: Colors.white,
            child: const Text('Browse APODs'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(height: size.height / 30),
      ],
    );
  }
}
