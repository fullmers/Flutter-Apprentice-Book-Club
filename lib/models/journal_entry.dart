import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:apod/features/shared/models/models.dart';

part 'journal_entry.freezed.dart';
part 'journal_entry.g.dart';

@Freezed()
class JournalEntry extends DataModel with _$JournalEntry {
  const factory JournalEntry({
    required String id,
    required String title,
    required String body,
    required DateTime date,
  }) = _JournalEntry;

  factory JournalEntry.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryFromJson(json);
}
