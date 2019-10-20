enum Measurement { KM, MILES }

class Stats {
  Stats({this.time, this.distance, this.pace, this.measurement});

  final double distance;
  final double time;
  final double pace;
  final Measurement measurement;

  Stats copyWith(
      {double time, double distance, double pace, Measurement measurement}) {
    return Stats(
      time: time ?? this.time,
      distance: distance ?? this.distance,
      pace: pace ?? this.pace,
      measurement: measurement ?? this.measurement,
    );
  }

  bool isEqual(Stats statTwo) {
    return this.time == statTwo.time &&
        this.distance == statTwo.distance &&
        this.pace == statTwo.pace &&
        this.measurement == statTwo.measurement;
  }

  Stats.fromJson(Map<String, dynamic> json)
      : time = json['time'],
        distance = json['distance'],
        pace = json['pace'],
        measurement = json['measurement'];

  Map<String, dynamic> toJson() => {
        'time': time,
        'distance': distance,
        'pace': pace,
        'measurement': measurement,
      };
}
