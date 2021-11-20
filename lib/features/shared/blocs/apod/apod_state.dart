import 'package:apod/features/shared/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'apod_state.freezed.dart';

@Freezed()
class ApodState with _$ApodState {
  const factory ApodState({
    @Default(<Apod>[]) List<Apod> apods,
    Apod? primaryApod,
  }) = _ApodState;

  factory ApodState.initial() => const ApodState();
}
