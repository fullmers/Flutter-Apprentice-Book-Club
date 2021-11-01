import 'package:apod/models/models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class AddJournalEntryPage extends StatefulWidget {
  const AddJournalEntryPage({required this.onSave, this.entry, Key? key})
      : super(key: key);

  final JournalEntry? entry;
  final Function(JournalEntry) onSave;

  static Page page({
    required Function(JournalEntry) onSave,
    JournalEntry? entry,
    LocalKey? key,
  }) =>
      MaterialPage<void>(
        key: key,
        child: AddJournalEntryPage(
          onSave: onSave,
          entry: entry,
        ),
      );

  @override
  _AddJournalEntryPageState createState() => _AddJournalEntryPageState();
}

class _AddJournalEntryPageState extends State<AddJournalEntryPage> {
  late final JournalEntry entry;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  DateTime? date;

  @override
  void initState() {
    super.initState();
    if (widget.entry != null) {
      titleController.text = widget.entry!.title;
      bodyController.text = widget.entry!.body;
      date = widget.entry!.date;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  void saveEntry() {
    final entry = JournalEntry(
      id: widget.entry?.id ?? const Uuid().v4(),
      title: titleController.text,
      body: bodyController.text,
      date: date ?? DateTime.now(),
    );
    widget.onSave(entry);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.entry?.title ?? 'Add Journal Entry'),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.check), onPressed: saveEntry),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            _TitleField(titleController),
            const SizedBox(height: 32),
            _BodyField(bodyController),
            const SizedBox(height: 32),
            _DateInput(
              date,
              onChanged: (date) {
                setState(() => this.date = date);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleField extends StatelessWidget {
  const _TitleField(this.controller, {Key? key}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Title',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        TextField(
          controller: controller,
          cursorColor: colorScheme.primary,
          decoration: InputDecoration(
            hintText: 'e.g., Deep thoughts',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: colorScheme.secondary),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: colorScheme.secondary),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: colorScheme.primary),
            ),
          ),
        ),
      ],
    );
  }
}

class _BodyField extends StatelessWidget {
  const _BodyField(this.controller, {Key? key}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Body',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        TextField(
          controller: controller,
          cursorColor: colorScheme.primary,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          style: Theme.of(context).textTheme.bodyText2,
          decoration: InputDecoration(
            hintText: 'Write your post here',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: colorScheme.secondary),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: colorScheme.secondary),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: colorScheme.primary),
            ),
          ),
        ),
      ],
    );
  }
}

class _DateInput extends StatelessWidget {
  const _DateInput(this.date, {required this.onChanged, Key? key})
      : super(key: key);

  final Function(DateTime) onChanged;
  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
              child: const Text('Select'),
              onPressed: () async {
                final currentDate = DateTime.now();
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: currentDate,
                  lastDate: DateTime(currentDate.year + 5),
                );
                if (selectedDate != null) {
                  onChanged(selectedDate);
                }
              },
            ),
          ],
        ),
        // 9
        Text(date != null ? DateFormat('yyyy-MM-dd').format(date!) : ''),
      ],
    );
  }
}
