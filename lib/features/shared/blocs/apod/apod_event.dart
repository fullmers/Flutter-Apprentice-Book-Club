import 'package:freezed_annotation/freezed_annotation.dart';

part 'apod_event.freezed.dart';

@Freezed()
class ApodEvent with _$ApodEvent {
  const factory ApodEvent.loadTodaysApod() = LoadTodaysApod;
  const factory ApodEvent.loadSpecificApod(String id) = LoadSpecificApod;
  const factory ApodEvent.loadRecentApods() = LoadRecentApods;
}
