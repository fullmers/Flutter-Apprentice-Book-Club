// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'journal_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JournalEntry _$JournalEntryFromJson(Map<String, dynamic> json) {
  return _JournalEntry.fromJson(json);
}

/// @nodoc
class _$JournalEntryTearOff {
  const _$JournalEntryTearOff();

  _JournalEntry call(
      {required String id,
      required String title,
      required String body,
      required DateTime date}) {
    return _JournalEntry(
      id: id,
      title: title,
      body: body,
      date: date,
    );
  }

  JournalEntry fromJson(Map<String, Object?> json) {
    return JournalEntry.fromJson(json);
  }
}

/// @nodoc
const $JournalEntry = _$JournalEntryTearOff();

/// @nodoc
mixin _$JournalEntry {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JournalEntryCopyWith<JournalEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalEntryCopyWith<$Res> {
  factory $JournalEntryCopyWith(
          JournalEntry value, $Res Function(JournalEntry) then) =
      _$JournalEntryCopyWithImpl<$Res>;
  $Res call({String id, String title, String body, DateTime date});
}

/// @nodoc
class _$JournalEntryCopyWithImpl<$Res> implements $JournalEntryCopyWith<$Res> {
  _$JournalEntryCopyWithImpl(this._value, this._then);

  final JournalEntry _value;
  // ignore: unused_field
  final $Res Function(JournalEntry) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$JournalEntryCopyWith<$Res>
    implements $JournalEntryCopyWith<$Res> {
  factory _$JournalEntryCopyWith(
          _JournalEntry value, $Res Function(_JournalEntry) then) =
      __$JournalEntryCopyWithImpl<$Res>;
  @override
  $Res call({String id, String title, String body, DateTime date});
}

/// @nodoc
class __$JournalEntryCopyWithImpl<$Res> extends _$JournalEntryCopyWithImpl<$Res>
    implements _$JournalEntryCopyWith<$Res> {
  __$JournalEntryCopyWithImpl(
      _JournalEntry _value, $Res Function(_JournalEntry) _then)
      : super(_value, (v) => _then(v as _JournalEntry));

  @override
  _JournalEntry get _value => super._value as _JournalEntry;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? date = freezed,
  }) {
    return _then(_JournalEntry(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JournalEntry implements _JournalEntry {
  const _$_JournalEntry(
      {required this.id,
      required this.title,
      required this.body,
      required this.date});

  factory _$_JournalEntry.fromJson(Map<String, dynamic> json) =>
      _$$_JournalEntryFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String body;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'JournalEntry(id: $id, title: $title, body: $body, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _JournalEntry &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, body, date);

  @JsonKey(ignore: true)
  @override
  _$JournalEntryCopyWith<_JournalEntry> get copyWith =>
      __$JournalEntryCopyWithImpl<_JournalEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JournalEntryToJson(this);
  }
}

abstract class _JournalEntry implements JournalEntry {
  const factory _JournalEntry(
      {required String id,
      required String title,
      required String body,
      required DateTime date}) = _$_JournalEntry;

  factory _JournalEntry.fromJson(Map<String, dynamic> json) =
      _$_JournalEntry.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get body;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$JournalEntryCopyWith<_JournalEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
