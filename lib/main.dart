import 'package:flutter/material.dart';
import 'package:pace_calculator/ui/screens/calculator.dart';
import 'package:pace_calculator/ui/screens/info.dart';
import 'package:pace_calculator/ui/widgets/slide.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pace_calculator/bloc/calculator/bloc.dart';
import 'package:pace_calculator/bloc/light_theme/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(BlocProvider<LightThemeBloc>(
      builder: (BuildContext context) =>
          LightThemeBloc((prefs.getBool('useLightTheme') ?? true)),
      child: Pace()));
}

class Pace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalculatorBloc>(
      builder: (BuildContext context) => CalculatorBloc(),
      child: BlocBuilder<LightThemeBloc, bool>(
        builder: (BuildContext context, bool useLightTheme) {
          return MaterialApp(
            title: 'Running Pace Calculator',
            theme: useLightTheme ? ThemeData.light() : ThemeData.dark(),
            initialRoute: '/',
            debugShowCheckedModeBanner: false,
            home: Calculator(),
            onGenerateRoute: (settings) {
              if (settings.name == "/info") {
                return SlideLeftRoute(page: Info());
              }
              // unknown route
              return MaterialPageRoute(builder: (context) => Container());
            },
          );
        },
      ),
    );
  }
}
