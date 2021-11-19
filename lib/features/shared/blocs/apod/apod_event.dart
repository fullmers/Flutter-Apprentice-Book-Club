abstract class ApodEvent {
  const ApodEvent();
}

class LoadTodaysApod extends ApodEvent {}

class LoadSpecificApod extends ApodEvent {
  const LoadSpecificApod(this.id);
  final String id;
}

class LoadRecentApods extends ApodEvent {
  const LoadRecentApods();
}
