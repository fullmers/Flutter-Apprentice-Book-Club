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
          final _entries = manager.entries;
          return _entries.isEmpty
              ? const EmptyJournalView()
              : JournalView(_entries);
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
