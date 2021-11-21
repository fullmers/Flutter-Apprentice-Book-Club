import 'package:apod/features/shared/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'apod_state.freezed.dart';

@Freezed()
class ApodState with _$ApodState {
  const factory ApodState({
    Apod? primaryApod,
    @Default(<Apod>[]) List<Apod> apods,
    @Default(<Apod>[]) List<Apod> favoriteApods,
  }) = _ApodState;

  factory ApodState.initial() => const ApodState();
}
