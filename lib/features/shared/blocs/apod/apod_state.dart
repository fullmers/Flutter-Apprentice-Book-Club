import 'package:apod/features/shared/models/models.dart';

class ApodState {
  const ApodState({
    required this.todaysApod,
  });

  final Apod? todaysApod;

  ApodState copyWith({
    Apod? todaysApod,
  }) =>
      ApodState(
        todaysApod: todaysApod ?? this.todaysApod,
      );
}
