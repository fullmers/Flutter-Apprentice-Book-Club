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
          return manager.entries.isEmpty
              ? const EmptyJournalView()
              : const JournalListView();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/journal/add'),
        child: const Icon(Icons.edit),
      ),
    );
  }
}
