import 'package:apod/features/shared/models/models.dart';

class ApodState {
  ApodState({
    required this.todaysApod,
    required this.apods,
  }) {
    if (todaysApod != null && !apods.contains(todaysApod)) {
      apods.add(todaysApod!);
    }
  }

  factory ApodState.initial() => ApodState(
        todaysApod: null,
        apods: [],
      );

  final Apod? todaysApod;
  final List<Apod> apods;
  Map<String, Apod>? _apodsMap;

  Apod? getApod(String id) {
    if (_apodsMap == null) {
      _prepareApodsMap();
    }
    return _apodsMap![id];
  }

  void _prepareApodsMap() {
    _apodsMap = <String, Apod>{};
    for (final _apod in apods) {
      _apodsMap![_apod.id] = _apod;
    }
  }

  ApodState copyWith({
    Apod? todaysApod,
    List<Apod>? apods,
  }) =>
      ApodState(
        todaysApod: todaysApod ?? this.todaysApod,
        apods: apods ?? this.apods,
      );
}
