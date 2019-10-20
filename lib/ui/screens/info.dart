import 'package:flutter/material.dart';
import 'package:pace_calculator/ui/widgets/bullet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pace_calculator/bloc/light_theme/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pace_calculator/translations/localisations.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _infoKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _infoKey,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).info),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              AppLocalizations.of(context).infoOne,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              AppLocalizations.of(context).infoTwo,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Bullet(),
                Text(
                  AppLocalizations.of(context).time,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Bullet(),
                Text(
                  AppLocalizations.of(context).distance,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Bullet(),
                Text(
                  AppLocalizations.of(context).pace,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Divider(
            endIndent: 16,
            indent: 16,
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    AppLocalizations.of(context).dark,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                BlocBuilder<LightThemeBloc, bool>(
                    builder: (BuildContext context, bool useLightTheme) {
                  return Switch(
                    value: !useLightTheme,
                    onChanged: (bool value) async {
                      BlocProvider.of<LightThemeBloc>(context).add(
                          value ? LightThemeEvent.off : LightThemeEvent.on);
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool('useLightTheme', !value);
                    },
                  );
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
