import 'package:flutter/material.dart';
import 'dart:core';
import 'package:pace_calculator/ui/widgets/error_text.dart';

class TimeInput extends StatelessWidget {
  TimeInput(
      {this.hoursController,
      this.minutesController,
      this.secondsController,
      this.hasError});

  final TextEditingController hoursController;
  final TextEditingController minutesController;
  final TextEditingController secondsController;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: hoursController,
                onChanged: (v) => null,
                decoration: InputDecoration(
                  labelText: 'Hours',
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: minutesController,
                  onChanged: (v) => null,
                  decoration: InputDecoration(
                    labelText: 'Minutes',
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: secondsController,
                onChanged: (v) => null,
                decoration: InputDecoration(
                  labelText: 'Seconds',
                ),
              ),
            )
          ],
        ),
        Container(
          child: hasError
              ? ErrorText('Distance and pace are required to calculate time.')
              : Container(
                  width: 0,
                  height: 0,
                ),
        )
      ],
    );
  }
}
