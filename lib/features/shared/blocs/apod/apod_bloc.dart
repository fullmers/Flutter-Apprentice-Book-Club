import 'dart:async';

import 'package:apod/features/shared/extensions.dart';
import 'package:apod/features/shared/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'apod_state.dart';
import 'apod_event.dart';

class ApodBloc extends Bloc<ApodEvent, ApodState> {
  ApodBloc(this._repository) : super(ApodState.initial()) {
    on<ApodEvent>(
      (ApodEvent event, Emitter<ApodState> emit) => event.map(
        loadTodaysApod: (event) => _loadTodaysApod(event, emit),
        loadSpecificApod: (event) => _loadSpecificApod(event, emit),
        loadRecentApods: (event) => _loadRecentApods(event, emit),
      ),
    );
  }
  final Repository<Apod> _repository;

  Future<void> _loadTodaysApod(
    LoadTodaysApod event,
    Emitter<ApodState> emit,
  ) async {
    final todaysApod = await _repository.getItem(DateTime.now().dateString());
    emit(state.copyWith(primaryApod: todaysApod));
  }

  Future<void> _loadSpecificApod(
    LoadSpecificApod event,
    Emitter<ApodState> emit,
  ) async {
    final specificApod = await _repository.getItem(event.id);
    if (specificApod != null) {
      emit(
        state.copyWith(
          primaryApod: specificApod,
          apods: <Apod>[
            ...state.apods,
            specificApod,
          ],
        ),
      );
    }
  }

  Future<void> _loadRecentApods(
    LoadRecentApods event,
    Emitter<ApodState> emit,
  ) async {
    List<Apod> apods = await _repository.getItems();
    if (apods.length < 15) {
      apods = await _repository.getItems(type: RequestType.remote);
    }
    emit(
      state.copyWith(apods: <Apod>[
        ...state.apods,
        ...apods,
      ]),
    );
  }
}
