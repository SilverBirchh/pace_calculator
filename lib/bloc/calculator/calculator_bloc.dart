import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import 'package:pace_calculator/api/calculator_api.dart';
import 'package:pace_calculator/data/stats.dart';
import 'package:pace_calculator/exceptions/stats_exception.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final CalculatorAPI _calculatorAPI = CalculatorAPI();

  @override
  CalculatorState get initialState => InitialCalculatorState();

  @override
  Stream<CalculatorState> mapEventToState(
    CalculatorEvent event,
  ) async* {
    if (event is CalculateDistance) {
      yield* _mapCalcDistanceToState(event);
    } else if (event is CalculateTime) {
      yield* _mapCalcTimeToState(event);
    } else if (event is CalculatePace) {
      yield* _mapCalcPaceToState(event);
    } else if (event is ToggleMeasurment) {
      yield* _mapSetMeasurementToState(event);
    } else if (event is Reset) {
      yield InitialCalculatorState();
    }
  }

  Stream<CalculatorState> _mapCalcDistanceToState(
      CalculateDistance event) async* {
    try {
      final Stats stats = _calculatorAPI.calculateDistance(event.stats);
      yield CalculatedValues(stats: stats);
    } on StatsException {
      yield DistanceError(stats: event.stats);
    }
  }

  Stream<CalculatorState> _mapCalcTimeToState(CalculateTime event) async* {
    try {
      final Stats stats = _calculatorAPI.calculateTime(event.stats);
      yield CalculatedValues(stats: stats);
    } on StatsException {
      yield TimeError(stats: event.stats);
    }
  }

  Stream<CalculatorState> _mapCalcPaceToState(CalculatePace event) async* {
    try {
      final Stats stats = _calculatorAPI.calculatePace(event.stats);
      yield CalculatedValues(stats: stats);
    } on StatsException {
      yield PaceError(stats: event.stats);
    }
  }

  Stream<CalculatorState> _mapSetMeasurementToState(
      ToggleMeasurment event) async* {
    final Stats stats = _calculatorAPI.switchMeasurement(event.stats);
    yield CalculatedValues(stats: stats);
  }
}
