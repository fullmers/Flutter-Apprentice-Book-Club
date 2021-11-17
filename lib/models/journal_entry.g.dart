// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JournalEntry _$$_JournalEntryFromJson(Map<String, dynamic> json) =>
    _$_JournalEntry(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_JournalEntryToJson(_$_JournalEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'date': instance.date.toIso8601String(),
    };
