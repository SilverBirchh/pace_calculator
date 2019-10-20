enum TYPE { TIME, PACE, DISTANCE }

class StatsException implements Exception {
  StatsException(this.message, this.type);

  final String message;
  final TYPE type;
}
