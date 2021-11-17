import 'package:apod/models/models.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class JournalListView extends StatelessWidget {
  const JournalListView({required this.entries, Key? key}) : super(key: key);
  final List<JournalEntry> entries;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => context.go('/journal/${entries[index].id}'),
        child: Dismissible(
          key: Key(entries[index].id),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            child: const Icon(Icons.delete_forever,
                color: Colors.white, size: 50.0),
          ),
          onDismissed: (direction) {
            context.read<JournalManager>().deleteItem(entries[index]);
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${entries[index].title} deleted')));
          },
          child: _EntryTile(entries[index]),
        ),
      ),
    );
  }
}

class _EntryTile extends StatelessWidget {
  const _EntryTile(this.entry, {Key? key}) : super(key: key);

  final JournalEntry entry;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(entry.title),
      subtitle: Text(
        entry.body.length >= 50 ? entry.body.substring(0, 50) : entry.body,
      ),
      trailing: Text(DateFormat('yyyy-MM-dd').format(entry.date)),
    );
  }
}
