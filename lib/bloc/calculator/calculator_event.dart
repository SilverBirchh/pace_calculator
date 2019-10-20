import 'package:meta/meta.dart';
import 'package:pace_calculator/data/stats.dart';

@immutable
abstract class CalculatorEvent {}

class CalculatePace extends CalculatorEvent {
  CalculatePace({this.stats});

  final Stats stats;
}

class CalculateDistance extends CalculatorEvent {
  CalculateDistance({this.stats});

  final Stats stats;
}

class CalculateTime extends CalculatorEvent {
  CalculateTime({this.stats});

  final Stats stats;
}

class ToggleMeasurment extends CalculatorEvent {
  ToggleMeasurment({this.stats});

  final Stats stats;
}

class Reset extends CalculatorEvent {}
