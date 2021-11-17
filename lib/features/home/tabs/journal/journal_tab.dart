import 'package:apod/models/models.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'journal.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<JournalManager>(
        builder: (context, manager, child) {
          return FutureBuilder<List<JournalEntry>>(
            future: manager.entries,
            builder: (BuildContext context,
                AsyncSnapshot<List<JournalEntry>> snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }
              if (snapshot.hasData) {
                final List<JournalEntry> entries = snapshot.data!;
                return entries.isEmpty
                    ? const EmptyJournalView()
                    : JournalListView(entries: entries);
              }
              return const EmptyJournalView();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/journal/add'),
        child: const Icon(Icons.edit),
      ),
    );
  }
}
