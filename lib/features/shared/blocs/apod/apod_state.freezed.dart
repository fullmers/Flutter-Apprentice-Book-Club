// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'apod_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ApodStateTearOff {
  const _$ApodStateTearOff();

  _ApodState call({List<Apod> apods = const <Apod>[], Apod? primaryApod}) {
    return _ApodState(
      apods: apods,
      primaryApod: primaryApod,
    );
  }
}

/// @nodoc
const $ApodState = _$ApodStateTearOff();

/// @nodoc
mixin _$ApodState {
  List<Apod> get apods => throw _privateConstructorUsedError;
  Apod? get primaryApod => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApodStateCopyWith<ApodState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApodStateCopyWith<$Res> {
  factory $ApodStateCopyWith(ApodState value, $Res Function(ApodState) then) =
      _$ApodStateCopyWithImpl<$Res>;
  $Res call({List<Apod> apods, Apod? primaryApod});

  $ApodCopyWith<$Res>? get primaryApod;
}

/// @nodoc
class _$ApodStateCopyWithImpl<$Res> implements $ApodStateCopyWith<$Res> {
  _$ApodStateCopyWithImpl(this._value, this._then);

  final ApodState _value;
  // ignore: unused_field
  final $Res Function(ApodState) _then;

  @override
  $Res call({
    Object? apods = freezed,
    Object? primaryApod = freezed,
  }) {
    return _then(_value.copyWith(
      apods: apods == freezed
          ? _value.apods
          : apods // ignore: cast_nullable_to_non_nullable
              as List<Apod>,
      primaryApod: primaryApod == freezed
          ? _value.primaryApod
          : primaryApod // ignore: cast_nullable_to_non_nullable
              as Apod?,
    ));
  }

  @override
  $ApodCopyWith<$Res>? get primaryApod {
    if (_value.primaryApod == null) {
      return null;
    }

    return $ApodCopyWith<$Res>(_value.primaryApod!, (value) {
      return _then(_value.copyWith(primaryApod: value));
    });
  }
}

/// @nodoc
abstract class _$ApodStateCopyWith<$Res> implements $ApodStateCopyWith<$Res> {
  factory _$ApodStateCopyWith(
          _ApodState value, $Res Function(_ApodState) then) =
      __$ApodStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Apod> apods, Apod? primaryApod});

  @override
  $ApodCopyWith<$Res>? get primaryApod;
}

/// @nodoc
class __$ApodStateCopyWithImpl<$Res> extends _$ApodStateCopyWithImpl<$Res>
    implements _$ApodStateCopyWith<$Res> {
  __$ApodStateCopyWithImpl(_ApodState _value, $Res Function(_ApodState) _then)
      : super(_value, (v) => _then(v as _ApodState));

  @override
  _ApodState get _value => super._value as _ApodState;

  @override
  $Res call({
    Object? apods = freezed,
    Object? primaryApod = freezed,
  }) {
    return _then(_ApodState(
      apods: apods == freezed
          ? _value.apods
          : apods // ignore: cast_nullable_to_non_nullable
              as List<Apod>,
      primaryApod: primaryApod == freezed
          ? _value.primaryApod
          : primaryApod // ignore: cast_nullable_to_non_nullable
              as Apod?,
    ));
  }
}

/// @nodoc

class _$_ApodState implements _ApodState {
  const _$_ApodState({this.apods = const <Apod>[], this.primaryApod});

  @JsonKey(defaultValue: const <Apod>[])
  @override
  final List<Apod> apods;
  @override
  final Apod? primaryApod;

  @override
  String toString() {
    return 'ApodState(apods: $apods, primaryApod: $primaryApod)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApodState &&
            const DeepCollectionEquality().equals(other.apods, apods) &&
            (identical(other.primaryApod, primaryApod) ||
                other.primaryApod == primaryApod));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(apods), primaryApod);

  @JsonKey(ignore: true)
  @override
  _$ApodStateCopyWith<_ApodState> get copyWith =>
      __$ApodStateCopyWithImpl<_ApodState>(this, _$identity);
}

abstract class _ApodState implements ApodState {
  const factory _ApodState({List<Apod> apods, Apod? primaryApod}) =
      _$_ApodState;

  @override
  List<Apod> get apods;
  @override
  Apod? get primaryApod;
  @override
  @JsonKey(ignore: true)
  _$ApodStateCopyWith<_ApodState> get copyWith =>
      throw _privateConstructorUsedError;
}
