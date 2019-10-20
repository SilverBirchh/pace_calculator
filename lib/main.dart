import 'package:flutter/material.dart';
import 'package:pace_calculator/ui/screens/calculator.dart';
import 'package:pace_calculator/ui/screens/info.dart';
import 'package:pace_calculator/ui/widgets/slide.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pace_calculator/bloc/calculator/bloc.dart';
import 'package:pace_calculator/bloc/light_theme/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pace_calculator/translations/localisations_delegate.dart';
import 'package:pace_calculator/translations/localisations.dart';

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
            localizationsDelegates: [
              const AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            localeResolutionCallback:
                (Locale locale, Iterable<Locale> supportedLocales) {
              for (Locale supportedLocale in supportedLocales) {
                if (locale == null) {
                  return supportedLocales.first;
                }

                if (supportedLocale.languageCode == locale?.languageCode ||
                    supportedLocale.countryCode == locale?.countryCode) {
                  return supportedLocale;
                }
              }

              return supportedLocales.first;
            },
            supportedLocales: [
              const Locale('en'),
            ],
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context).title,
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
