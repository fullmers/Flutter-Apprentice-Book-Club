import 'package:apod/features/shared/models/models.dart';

class ApodState {
  ApodState({
    required List<Apod> apods,
    required this.todaysApod,
  }) : _apods = apods.toSet() {
    if (todaysApod != null && !apods.contains(todaysApod)) {
      apods.add(todaysApod!);
    }
  }

  factory ApodState.initial() => ApodState(
        todaysApod: null,
        apods: [],
      );

  final Apod? todaysApod;
  final Set<Apod> _apods;
  List<Apod>? _apodsList;
  Map<String, Apod>? _apodsMap;

  List<Apod> get apods => _apodsList ??= _apods.toList();

  Apod? getApod(String id) {
    if (_apodsMap == null) {
      _prepareApodsMap();
    }
    return _apodsMap![id];
  }

  void _prepareApodsMap() {
    _apodsMap = <String, Apod>{};
    for (final _apod in _apods) {
      _apodsMap![_apod.id] = _apod;
    }
  }

  ApodState copyWith({
    Apod? todaysApod,
    List<Apod>? apods,
  }) =>
      ApodState(
        todaysApod: todaysApod ?? this.todaysApod,
        apods: apods ?? _apods.toList(),
      );
}
