import 'package:flutter/material.dart';
import 'package:pace_calculator/data/stats.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pace_calculator/bloc/calculator/bloc.dart';
import 'package:pace_calculator/ui/widgets/error_text.dart';
import 'package:pace_calculator/translations/localisations.dart';

class DistanceInput extends StatelessWidget {
  DistanceInput({this.distanceController, this.onChanged, this.hasError});

  final TextEditingController distanceController;
  final Function onChanged;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    Measurement measurement =
        BlocProvider.of<CalculatorBloc>(context).state.stats.measurement;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: distanceController,
                  decoration: InputDecoration(
                    labelText: measurement == Measurement.KM
                        ? AppLocalizations.of(context).km
                        : AppLocalizations.of(context).miles,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: DropdownButton<Measurement>(
                value: measurement,
                isExpanded: true,
                isDense: true,
                items: Measurement.values.map(
                  (Measurement measurement) {
                    return DropdownMenuItem<Measurement>(
                      value: measurement,
                      child: measurement == Measurement.KM
                          ? Text(
                              AppLocalizations.of(context).km.toUpperCase(),
                            )
                          : Text(AppLocalizations.of(context).miles),
                    );
                  },
                ).toList(),
                onChanged: (Measurement measurement) => onChanged(measurement),
              ),
            )
          ],
        ),
        hasError
            ? ErrorText(AppLocalizations.of(context).distError)
            : Container(
                width: 0,
                height: 0,
              )
      ],
    );
  }
}
