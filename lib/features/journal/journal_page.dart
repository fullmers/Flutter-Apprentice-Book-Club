import 'package:apod/features/journal/journal.dart';
import 'package:apod/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<JournalManager>(
        builder: (context, manager, child) {
          return manager.entries.isEmpty
              ? const EmptyJournalView()
              : const JournalView();
        },
      ),
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
