import 'package:apod/features/journal/empty_journal_view.dart';
import 'package:flutter/material.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const EmptyJournalView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {},
        ),
      ),
    );
  }
}
