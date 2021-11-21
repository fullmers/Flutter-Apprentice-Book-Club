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

  _ApodState call(
      {Apod? primaryApod,
      List<Apod> apods = const <Apod>[],
      List<Apod> favoriteApods = const <Apod>[]}) {
    return _ApodState(
      primaryApod: primaryApod,
      apods: apods,
      favoriteApods: favoriteApods,
    );
  }
}

/// @nodoc
const $ApodState = _$ApodStateTearOff();

/// @nodoc
mixin _$ApodState {
  Apod? get primaryApod => throw _privateConstructorUsedError;
  List<Apod> get apods => throw _privateConstructorUsedError;
  List<Apod> get favoriteApods => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApodStateCopyWith<ApodState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApodStateCopyWith<$Res> {
  factory $ApodStateCopyWith(ApodState value, $Res Function(ApodState) then) =
      _$ApodStateCopyWithImpl<$Res>;
  $Res call({Apod? primaryApod, List<Apod> apods, List<Apod> favoriteApods});

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
    Object? primaryApod = freezed,
    Object? apods = freezed,
    Object? favoriteApods = freezed,
  }) {
    return _then(_value.copyWith(
      primaryApod: primaryApod == freezed
          ? _value.primaryApod
          : primaryApod // ignore: cast_nullable_to_non_nullable
              as Apod?,
      apods: apods == freezed
          ? _value.apods
          : apods // ignore: cast_nullable_to_non_nullable
              as List<Apod>,
      favoriteApods: favoriteApods == freezed
          ? _value.favoriteApods
          : favoriteApods // ignore: cast_nullable_to_non_nullable
              as List<Apod>,
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
  $Res call({Apod? primaryApod, List<Apod> apods, List<Apod> favoriteApods});

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
    Object? primaryApod = freezed,
    Object? apods = freezed,
    Object? favoriteApods = freezed,
  }) {
    return _then(_ApodState(
      primaryApod: primaryApod == freezed
          ? _value.primaryApod
          : primaryApod // ignore: cast_nullable_to_non_nullable
              as Apod?,
      apods: apods == freezed
          ? _value.apods
          : apods // ignore: cast_nullable_to_non_nullable
              as List<Apod>,
      favoriteApods: favoriteApods == freezed
          ? _value.favoriteApods
          : favoriteApods // ignore: cast_nullable_to_non_nullable
              as List<Apod>,
    ));
  }
}

/// @nodoc

class _$_ApodState implements _ApodState {
  const _$_ApodState(
      {this.primaryApod,
      this.apods = const <Apod>[],
      this.favoriteApods = const <Apod>[]});

  @override
  final Apod? primaryApod;
  @JsonKey(defaultValue: const <Apod>[])
  @override
  final List<Apod> apods;
  @JsonKey(defaultValue: const <Apod>[])
  @override
  final List<Apod> favoriteApods;

  @override
  String toString() {
    return 'ApodState(primaryApod: $primaryApod, apods: $apods, favoriteApods: $favoriteApods)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApodState &&
            (identical(other.primaryApod, primaryApod) ||
                other.primaryApod == primaryApod) &&
            const DeepCollectionEquality().equals(other.apods, apods) &&
            const DeepCollectionEquality()
                .equals(other.favoriteApods, favoriteApods));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      primaryApod,
      const DeepCollectionEquality().hash(apods),
      const DeepCollectionEquality().hash(favoriteApods));

  @JsonKey(ignore: true)
  @override
  _$ApodStateCopyWith<_ApodState> get copyWith =>
      __$ApodStateCopyWithImpl<_ApodState>(this, _$identity);
}

abstract class _ApodState implements ApodState {
  const factory _ApodState(
      {Apod? primaryApod,
      List<Apod> apods,
      List<Apod> favoriteApods}) = _$_ApodState;

  @override
  Apod? get primaryApod;
  @override
  List<Apod> get apods;
  @override
  List<Apod> get favoriteApods;
  @override
  @JsonKey(ignore: true)
  _$ApodStateCopyWith<_ApodState> get copyWith =>
      throw _privateConstructorUsedError;
}
