import 'package:flutter/material.dart';
import 'dart:core';
import 'package:pace_calculator/ui/widgets/error_text.dart';
import 'package:pace_calculator/translations/localisations.dart';

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
                  labelText: AppLocalizations.of(context).hour,
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
                    labelText: AppLocalizations.of(context).minutes,
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
                  labelText: AppLocalizations.of(context).seconds,
                ),
              ),
            )
          ],
        ),
        Container(
          child: hasError
              ? ErrorText(AppLocalizations.of(context).timeError)
              : Container(
                  width: 0,
                  height: 0,
                ),
        )
      ],
    );
  }
}
