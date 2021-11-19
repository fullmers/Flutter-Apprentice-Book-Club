import 'dart:async';

import 'package:apod/features/shared/extensions.dart';
import 'package:apod/features/shared/models/models.dart';

import 'apod_state.dart';
import 'apod_event.dart';

class ApodBloc {
  ApodBloc(this._repository)
      : _stateController = StreamController<ApodState>.broadcast(),
        _eventsController = StreamController<ApodEvent>(),
        state = ApodState.initial() {
    _eventsController.stream.listen(_processEvent);
  }

  final Repository<Apod> _repository;
  final StreamController<ApodState> _stateController;
  final StreamController<ApodEvent> _eventsController;
  ApodState state;

  void _processEvent(ApodEvent event) async {
    /// Handler for [LoadTodaysApod]
    if (event is LoadTodaysApod) {
      final todaysApod = await _repository.getItem(DateTime.now().dateString());
      state = state.copyWith(todaysApod: todaysApod);

      /// Handler for [LoadSpecificApod]
    } else if (event is LoadSpecificApod) {
      final specificApod = await _repository.getItem(event.id);
      if (specificApod != null) {
        state = state.copyWith(
            apods: state.apods
              ..add(specificApod)
              ..sort((a, b) => b.id.compareTo(a.id)));
      }

      /// Handler for [LoadRecentApods]
    } else if (event is LoadRecentApods) {
      List<Apod> apods = await _repository.getItems();
      if (apods.length < 15) {
        apods = await _repository.getItems(type: RequestType.remote);
      }

      state = state.copyWith(
          apods: state.apods
            ..addAll(apods)
            ..sort((a, b) => b.id.compareTo(a.id)));
    }

    _stateController.sink.add(state);
  }

  Stream<ApodState> get stream => _stateController.stream;
  void add(ApodEvent event) => _eventsController.sink.add(event);
}
