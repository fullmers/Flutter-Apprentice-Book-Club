import 'dart:async';

import 'package:apod/features/shared/extensions.dart';
import 'package:apod/features/shared/models/models.dart';

import 'apod_state.dart';
import 'apod_event.dart';

class ApodBloc {
  ApodBloc(this._repository)
      : _stateController = StreamController<ApodState>.broadcast(),
        _eventsController = StreamController<ApodEvent>(),
        state = const ApodState(todaysApod: null) {
    _eventsController.stream.listen(_processEvent);
  }

  final Repository<Apod> _repository;
  final StreamController<ApodState> _stateController;
  final StreamController<ApodEvent> _eventsController;
  ApodState state;

  void _processEvent(ApodEvent event) async {
    if (event is LoadTodaysApod) {
      final todaysApod = await _repository.getItem(DateTime.now().dateString());
      state = state.copyWith(todaysApod: todaysApod);
      _stateController.sink.add(state);
    }
  }

  Stream<ApodState> get stream => _stateController.stream;
  void add(ApodEvent event) => _eventsController.sink.add(event);
}
