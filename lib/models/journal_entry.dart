class JournalEntry {
  const JournalEntry({
    required this.id,
    required this.title,
    required this.body,
    required this.date,
  });
  final String id;
  final String title;
  final String body;
  final DateTime date;

  JournalEntry copyWith({
    String? id,
    String? title,
    String? body,
    DateTime? date,
  }) =>
      JournalEntry(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        date: date ?? this.date,
      );
}
