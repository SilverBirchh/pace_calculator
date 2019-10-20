import 'package:flutter/material.dart';
import 'package:pace_calculator/ui/widgets/header.dart';
import 'package:pace_calculator/ui/widgets/time_input.dart';
import 'package:pace_calculator/ui/widgets/pace_input.dart';
import 'package:pace_calculator/ui/widgets/calc_button.dart';
import 'package:pace_calculator/ui/widgets/distance_input.dart';
import 'package:pace_calculator/ui/widgets/wave.dart';

import 'package:pace_calculator/data/stats.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pace_calculator/bloc/calculator/bloc.dart';
import 'package:pace_calculator/helpers/timings.dart';

enum SOURCE { TIME, DISTANCE, PACE }

class CalculatorForm extends StatefulWidget {
  @override
  CalculatorFormState createState() => CalculatorFormState();
}

class CalculatorFormState extends State<CalculatorForm> {
  TextEditingController timeHoursController;
  TextEditingController timeMinutesController;
  TextEditingController timeSecondsController;
  TextEditingController paceMinutesController;
  TextEditingController paceSecondsController;
  TextEditingController distanceController;

  bool shouldRebuild = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CalculatorBloc, CalculatorState>(
      listener: (BuildContext context, CalculatorState state) {
        setState(() {
          shouldRebuild = true;
        });
      },
      child: BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (BuildContext context, CalculatorState calculatorState) {
          if (shouldRebuild) {
            _setTextControllers(calculatorState.stats);
            shouldRebuild = false;
          }

          Measurement measurement =
              BlocProvider.of<CalculatorBloc>(context).state.stats.measurement;

          final double height = MediaQuery.of(context).size.height;

          return Stack(
            children: <Widget>[
              height > 865
                  ? Positioned(
                      bottom: 0,
                      child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: Background()),
                    )
                  : Container(
                      width: 0,
                      height: 0,
                    ),
              ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Header('Time'),
                        TimeInput(
                          hoursController: timeHoursController,
                          minutesController: timeMinutesController,
                          secondsController: timeSecondsController,
                          hasError: calculatorState is TimeError,
                        ),
                        CalcButton(
                          text: 'Calculate Time',
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            calculateStats(SOURCE.TIME);
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Header('Distance'),
                        DistanceInput(
                          distanceController: distanceController,
                          onChanged: onMeasurementChange,
                          hasError: calculatorState is DistanceError,
                        ),
                        CalcButton(
                          text: 'Calculate Distance',
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            calculateStats(SOURCE.DISTANCE);
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Header(measurement == Measurement.KM
                            ? 'Pace Per Kilometer'
                            : 'Pace Per Mile'),
                        PaceInput(
                          minutesController: paceMinutesController,
                          secondsController: paceSecondsController,
                          hasError: calculatorState is PaceError,
                        ),
                        CalcButton(
                          text: 'Calculate Pace',
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            calculateStats(SOURCE.PACE);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  void onMeasurementChange(Measurement measurement) {
    final Stats stats = _collateStats();
    BlocProvider.of<CalculatorBloc>(context).add(
      ToggleMeasurment(stats: stats),
    );
  }

  void calculateStats(SOURCE source) {
    final Stats stats = _collateStats();

    if (source == SOURCE.DISTANCE) {
      BlocProvider.of<CalculatorBloc>(context).add(
        CalculateDistance(stats: stats),
      );
    } else if (source == SOURCE.PACE) {
      BlocProvider.of<CalculatorBloc>(context).add(
        CalculatePace(stats: stats),
      );
    } else {
      BlocProvider.of<CalculatorBloc>(context).add(
        CalculateTime(stats: stats),
      );
    }
  }

  Stats _collateStats() {
    final double distance = distanceController.text == ''
        ? null
        : double.parse(distanceController.text);
    final double time = Timings.addSeconds(
      hours: timeHoursController.text,
      minutes: timeMinutesController.text,
      seconds: timeSecondsController.text,
    );

    final double pace = Timings.addSeconds(
        minutes: paceMinutesController.text,
        seconds: paceSecondsController.text);

    return Stats(
        distance: distance,
        time: time,
        pace: pace,
        measurement:
            BlocProvider.of<CalculatorBloc>(context).state.stats.measurement);
  }

  void _setTextControllers(Stats stats) {
    timeHoursController = TextEditingController(
      text: Timings.secondsToHours(stats.time),
    );
    timeMinutesController = TextEditingController(
      text: Timings.secondsToMinutes(stats.time),
    );
    timeSecondsController = TextEditingController(
      text: Timings.secondsToSecondsRemaining(stats.time),
    );
    distanceController = TextEditingController(
      text: stats.distance == null ? null : stats.distance.toStringAsFixed(1),
    );
    paceMinutesController = TextEditingController(
      text: Timings.paceSecondsToMinutes(stats.pace),
    );
    paceSecondsController = TextEditingController(
      text: Timings.paceSecondsLeft(stats.pace),
    );
  }

  void dispose() {
    timeHoursController.dispose();
    timeMinutesController.dispose();
    timeSecondsController.dispose();
    distanceController.dispose();
    paceMinutesController.dispose();
    paceSecondsController.dispose();
    super.dispose();
  }
}
