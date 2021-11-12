// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'apod_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApodRequestParameters _$ApodRequestParametersFromJson(
    Map<String, dynamic> json) {
  return _ApodRequestParameters.fromJson(json);
}

/// @nodoc
class _$ApodRequestParametersTearOff {
  const _$ApodRequestParametersTearOff();

  _ApodRequestParameters call(
      {@OptionalDateTimeConverter()
      @JsonKey(name: 'start_date')
          DateTime? startDate,
      @OptionalDateTimeConverter()
      @JsonKey(name: 'end_date')
          DateTime? endDate,
      @OptionalDateTimeConverter()
          DateTime? date,
      int? count}) {
    return _ApodRequestParameters(
      startDate: startDate,
      endDate: endDate,
      date: date,
      count: count,
    );
  }

  ApodRequestParameters fromJson(Map<String, Object?> json) {
    return ApodRequestParameters.fromJson(json);
  }
}

/// @nodoc
const $ApodRequestParameters = _$ApodRequestParametersTearOff();

/// @nodoc
mixin _$ApodRequestParameters {
  /// Optional filter for the earliest date from which we desire results.
  @OptionalDateTimeConverter()
  @JsonKey(name: 'start_date')
  DateTime? get startDate => throw _privateConstructorUsedError;

  /// Optional filter for the latest date from which we desire results.
  @OptionalDateTimeConverter()
  @JsonKey(name: 'end_date')
  DateTime? get endDate => throw _privateConstructorUsedError;

  /// Optional filter for only date from which we desire results.
  @OptionalDateTimeConverter()
  DateTime? get date => throw _privateConstructorUsedError;

  /// Optional limit to how many results should be returned.
  int? get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApodRequestParametersCopyWith<ApodRequestParameters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApodRequestParametersCopyWith<$Res> {
  factory $ApodRequestParametersCopyWith(ApodRequestParameters value,
          $Res Function(ApodRequestParameters) then) =
      _$ApodRequestParametersCopyWithImpl<$Res>;
  $Res call(
      {@OptionalDateTimeConverter()
      @JsonKey(name: 'start_date')
          DateTime? startDate,
      @OptionalDateTimeConverter()
      @JsonKey(name: 'end_date')
          DateTime? endDate,
      @OptionalDateTimeConverter()
          DateTime? date,
      int? count});
}

/// @nodoc
class _$ApodRequestParametersCopyWithImpl<$Res>
    implements $ApodRequestParametersCopyWith<$Res> {
  _$ApodRequestParametersCopyWithImpl(this._value, this._then);

  final ApodRequestParameters _value;
  // ignore: unused_field
  final $Res Function(ApodRequestParameters) _then;

  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? date = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$ApodRequestParametersCopyWith<$Res>
    implements $ApodRequestParametersCopyWith<$Res> {
  factory _$ApodRequestParametersCopyWith(_ApodRequestParameters value,
          $Res Function(_ApodRequestParameters) then) =
      __$ApodRequestParametersCopyWithImpl<$Res>;
  @override
  $Res call(
      {@OptionalDateTimeConverter()
      @JsonKey(name: 'start_date')
          DateTime? startDate,
      @OptionalDateTimeConverter()
      @JsonKey(name: 'end_date')
          DateTime? endDate,
      @OptionalDateTimeConverter()
          DateTime? date,
      int? count});
}

/// @nodoc
class __$ApodRequestParametersCopyWithImpl<$Res>
    extends _$ApodRequestParametersCopyWithImpl<$Res>
    implements _$ApodRequestParametersCopyWith<$Res> {
  __$ApodRequestParametersCopyWithImpl(_ApodRequestParameters _value,
      $Res Function(_ApodRequestParameters) _then)
      : super(_value, (v) => _then(v as _ApodRequestParameters));

  @override
  _ApodRequestParameters get _value => super._value as _ApodRequestParameters;

  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? date = freezed,
    Object? count = freezed,
  }) {
    return _then(_ApodRequestParameters(
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ApodRequestParameters extends _ApodRequestParameters {
  const _$_ApodRequestParameters(
      {@OptionalDateTimeConverter() @JsonKey(name: 'start_date') this.startDate,
      @OptionalDateTimeConverter() @JsonKey(name: 'end_date') this.endDate,
      @OptionalDateTimeConverter() this.date,
      this.count})
      : super._();

  factory _$_ApodRequestParameters.fromJson(Map<String, dynamic> json) =>
      _$$_ApodRequestParametersFromJson(json);

  @override

  /// Optional filter for the earliest date from which we desire results.
  @OptionalDateTimeConverter()
  @JsonKey(name: 'start_date')
  final DateTime? startDate;
  @override

  /// Optional filter for the latest date from which we desire results.
  @OptionalDateTimeConverter()
  @JsonKey(name: 'end_date')
  final DateTime? endDate;
  @override

  /// Optional filter for only date from which we desire results.
  @OptionalDateTimeConverter()
  final DateTime? date;
  @override

  /// Optional limit to how many results should be returned.
  final int? count;

  @override
  String toString() {
    return 'ApodRequestParameters(startDate: $startDate, endDate: $endDate, date: $date, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApodRequestParameters &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate, date, count);

  @JsonKey(ignore: true)
  @override
  _$ApodRequestParametersCopyWith<_ApodRequestParameters> get copyWith =>
      __$ApodRequestParametersCopyWithImpl<_ApodRequestParameters>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApodRequestParametersToJson(this);
  }
}

abstract class _ApodRequestParameters extends ApodRequestParameters {
  const factory _ApodRequestParameters(
      {@OptionalDateTimeConverter()
      @JsonKey(name: 'start_date')
          DateTime? startDate,
      @OptionalDateTimeConverter()
      @JsonKey(name: 'end_date')
          DateTime? endDate,
      @OptionalDateTimeConverter()
          DateTime? date,
      int? count}) = _$_ApodRequestParameters;
  const _ApodRequestParameters._() : super._();

  factory _ApodRequestParameters.fromJson(Map<String, dynamic> json) =
      _$_ApodRequestParameters.fromJson;

  @override

  /// Optional filter for the earliest date from which we desire results.
  @OptionalDateTimeConverter()
  @JsonKey(name: 'start_date')
  DateTime? get startDate;
  @override

  /// Optional filter for the latest date from which we desire results.
  @OptionalDateTimeConverter()
  @JsonKey(name: 'end_date')
  DateTime? get endDate;
  @override

  /// Optional filter for only date from which we desire results.
  @OptionalDateTimeConverter()
  DateTime? get date;
  @override

  /// Optional limit to how many results should be returned.
  int? get count;
  @override
  @JsonKey(ignore: true)
  _$ApodRequestParametersCopyWith<_ApodRequestParameters> get copyWith =>
      throw _privateConstructorUsedError;
}
