import 'package:flutter/material.dart';
import 'package:pace_calculator/ui/widgets/error_text.dart';

class PaceInput extends StatelessWidget {
  PaceInput({this.minutesController, this.secondsController, this.hasError});

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
        hasError
            ? ErrorText('Time and distance are required to calculate pace.')
            : Container(
                width: 0,
                height: 0,
              )
      ],
    );
  }
}
