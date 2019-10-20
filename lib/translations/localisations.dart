import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.languageCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get title {
    return Intl.message(
      'Running Pace Calculator',
      name: 'title',
      desc: 'title',
    );
  }

  String get shortTitle {
    return Intl.message(
      'Pace Calculator',
      name: 'shortTitle',
      desc: 'shortTitle',
    );
  }

  String get info {
    return Intl.message(
      'Information',
      name: 'info',
      desc: 'info',
    );
  }

  String get infoOne {
    return Intl.message(
      'The running pace calculator helps you to calculate the time, distance or pace of your run. Calculating your pace is not only interesting, but also useful, as it helps you to run and train better.',
      name: 'infoOne',
      desc: 'infoOne',
    );
  }

  String get infoTwo {
    return Intl.message(
      'Enter any two values to calculate the third:',
      name: 'infoTwo',
      desc: 'infoTwo',
    );
  }

  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: 'time',
    );
  }

  String get distance {
    return Intl.message(
      'Distance',
      name: 'distance',
      desc: 'distance',
    );
  }

  String get pace {
    return Intl.message(
      'Pace',
      name: 'pace',
      desc: 'pace',
    );
  }

  String get calcPace {
    return Intl.message(
      'Calculate Pace',
      name: 'calcPace',
      desc: 'calcPace',
    );
  }

  String get paceKM {
    return Intl.message(
      'Pace Per Kilometer',
      name: 'paceKM',
      desc: 'paceKM',
    );
  }

  String get km {
    return Intl.message(
      'Km',
      name: 'km',
      desc: 'km',
    );
  }

  String get seconds {
    return Intl.message(
      'Seconds',
      name: 'seconds',
      desc: 'seconds',
    );
  }

  String get minutes {
    return Intl.message(
      'Minutes',
      name: 'minutes',
      desc: 'minutes',
    );
  }

  String get hour {
    return Intl.message(
      'Hours',
      name: 'hour',
      desc: 'hour',
    );
  }

  String get distError {
    return Intl.message(
      'Time and pace are required to calculate distance.',
      name: 'distError',
      desc: 'distError',
    );
  }

  String get timeError {
    return Intl.message(
      'Distance and pace are required to calculate time.',
      name: 'timeError',
      desc: 'timeError',
    );
  }

  String get paceError {
    return Intl.message(
      'Time and distance are required to calculate pace.',
      name: 'paceError',
      desc: 'paceError',
    );
  }

  String get miles {
    return Intl.message(
      'Miles',
      name: 'miles',
      desc: 'miles',
    );
  }

  String get paceMile {
    return Intl.message(
      'Pace Per Mile',
      name: 'paceMile',
      desc: 'paceMile',
    );
  }

  String get calcTime {
    return Intl.message(
      'Calculate Time',
      name: 'calcTime',
      desc: 'calcTime',
    );
  }

  String get calcDistance {
    return Intl.message(
      'Calculate Distance',
      name: 'calcDistance',
      desc: 'calcDistance',
    );
  }

  String get dark {
    return Intl.message(
      'Dark theme',
      name: 'dark',
      desc: 'dark',
    );
  }
}
