import 'package:pace_calculator/data/stats.dart';
import 'package:pace_calculator/exceptions/stats_exception.dart';

class CalculatorAPI {
  bool _isValid(double double) {
    return double != null && double != 0.0 && double != 0;
  }

  Stats calculateTime(Stats stats) {
    if (_isValid(stats.distance) && _isValid(stats.pace)) {
      return stats.copyWith(time: (stats.distance * stats.pace));
    }

    throw StatsException(
        'Distance and pace are required to calculate time.', TYPE.TIME);
  }

  Stats calculatePace(Stats stats) {
    if (_isValid(stats.time) && _isValid(stats.distance)) {
      return stats.copyWith(pace: (stats.time / stats.distance));
    }

    throw StatsException(
        'Time and distance are required to calculate pace.', TYPE.PACE);
  }

  Stats calculateDistance(Stats stats) {
    if (_isValid(stats.time) && _isValid(stats.pace)) {
      return stats.copyWith(distance: (stats.time / stats.pace));
    }
    throw StatsException(
        'Time and pace are required to calculate distance.', TYPE.DISTANCE);
  }

  Stats switchMeasurement(Stats stats) {
    final newStats = stats.copyWith(
        distance: _toggleDistance(stats),
        pace: _togglePace(stats),
        measurement: stats.measurement == Measurement.KM
            ? Measurement.MILES
            : Measurement.KM);
    return newStats;
  }

  double _toggleDistance(Stats stat) {
    if (!_isValid(stat.distance)) {
      return null;
    }
    return stat.measurement == Measurement.KM
        ? (stat.distance * 0.62137)
        : (stat.distance / 0.62137);
  }

  double _togglePace(Stats stat) {
    if (!_isValid(stat.distance)) {
      return null;
    }
    if (stat.time == 0.0 && stat.distance == 0.0) {
      return 0;
    }
    double distance = stat.measurement == Measurement.KM
        ? (stat.distance * 0.62137)
        : (stat.distance / 0.62137);
    return stat.time / distance;
  }
}
