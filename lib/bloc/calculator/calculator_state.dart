import 'package:meta/meta.dart';
import 'package:pace_calculator/data/stats.dart';

@immutable
abstract class CalculatorState {
  CalculatorState({this.stats});
  final Stats stats;
}

class InitialCalculatorState extends CalculatorState {
  InitialCalculatorState()
      : super(
            stats: Stats(
                distance: null,
                pace: null,
                time: null,
                measurement: Measurement.KM));
}

class CalculatedValues extends CalculatorState {
  CalculatedValues({Stats stats}) : super(stats: stats);
}

class TimeError extends CalculatorState {
  TimeError({Stats stats}) : super(stats: stats);
}

class PaceError extends CalculatorState {
  PaceError({Stats stats}) : super(stats: stats);
}

class DistanceError extends CalculatorState {
  DistanceError({Stats stats}) : super(stats: stats);
}
