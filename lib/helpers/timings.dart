class Timings {
  static String secondsToHours(double time) {
    if (time == null) {
      return null;
    }

    if (time == 0.0) {
      return '0';
    }
    int hours = (time / 3600).floor();
    return hours.toStringAsFixed(0);
  }

  static String secondsToMinutes(double time) {
    if (time == null) {
      return null;
    }

    if (time == 0.0) {
      return '0';
    }
    int hours = (time / 3600).floor();
    time = time - (hours * 3600);
    int minutes = (time / 60).floor();
    return minutes.toStringAsFixed(0);
  }

  static String secondsToSecondsRemaining(double time) {
    if (time == null) {
      return null;
    }
    if (time == 0.0) {
      return '0';
    }
    int hours = (time / 3600).floor();
    time = time - (hours * 3600);
    int minutes = (time / 60).floor();
    time = time - (minutes * 60);
    return time.floor().toStringAsFixed(0);
  }

  static String paceSecondsToMinutes(double pace) {
    if (pace == null) {
      return null;
    }
    if (pace == 0.0) {
      return '0';
    }
    int minutes = (pace / 60).floor();
    return minutes.toStringAsFixed(0);
  }

  static String paceSecondsLeft(double pace) {
    if (pace == null) {
      return null;
    }
    if (pace == 0.0) {
      return '0';
    }
    int minutes = (pace / 60).floor();
    pace = pace - (minutes * 60);
    return pace.floor().toStringAsFixed(0);
  }

  static double addSeconds(
      {String hours = '0', String minutes = '0', String seconds = '0'}) {

    if ((hours == '' && minutes == '' && seconds == '') || (minutes == '' && seconds == '')) {
      return null;
    }

    hours = hours == '' ? '0' : hours;
    minutes = minutes == '' ? '0' : minutes;
    seconds = seconds == '' ? '0' : seconds;
    double cumlativeCeconds = 0;
    cumlativeCeconds = cumlativeCeconds + (double.parse(hours) * 3600);
    cumlativeCeconds = cumlativeCeconds + (double.parse(minutes) * 60);
    cumlativeCeconds = cumlativeCeconds + double.parse(seconds);
    return cumlativeCeconds;
  }
}
