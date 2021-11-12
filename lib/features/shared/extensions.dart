extension ApodDateTime on DateTime {
  String dateString() => '$year-$month-$day';
}

extension ApodString on String {
  DateTime toDateTimeAsDateString() {
    final List<String> parts = split('-');
    return DateTime(
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    );
  }
}
