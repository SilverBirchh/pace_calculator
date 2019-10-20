import 'package:flutter/material.dart';
import 'package:pace_calculator/ui/widgets/calculator_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pace_calculator/bloc/calculator/bloc.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final GlobalKey<ScaffoldState> _calculatorKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: height > 865 ? false : true,
      key: _calculatorKey,
      appBar: AppBar(
        leading: Icon(Icons.directions_run),
        title: Text('Pace Calculator'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
              BlocProvider.of<CalculatorBloc>(context).add(Reset());
            },
          ),
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
              Navigator.pushNamed(context, '/info');
            },
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: CalculatorForm(),
      ),
    );
  }
}
