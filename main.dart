import 'package:latlong2/latlong.dart';

void main() {
  List<double> logitude = [23, 24, 24];
  List<double> Lantiide = [40, 41, 41.5];
  List<double> Oldlogitude = [23, 24, 26];
  List<double> OldLantiide = [40, 41, 42];
  ai_data cool =
      Ai().main(logitude, Lantiide, Oldlogitude, OldLantiide, 8000000);
  print(cool.AvgSpeed);
  print(cool.speed);
  print(cool.distance);
  print(cool.extra_data.ahead);
  print(cool.extra_data.are_you_ahead);
  //196.52626620000004
  // 167.69480355000002
  // 195228.0
  // 145015.0
  // false
}

class bro_this_return_a_class_use_ahead_and_are_you_ahead {
  late double ahead;
  late bool are_you_ahead;
}

class ai_data {
  late double speed;
  late double distance;
  late double AvgSpeed;
  late bro_this_return_a_class_use_ahead_and_are_you_ahead extra_data;
}

class Ai {
  ai_data main(List<double> logitude, List<double> Lantiide,
      List<double> Oldlogitude, List<double> OldLantiide, double time) {
    ai_data return_data = ai_data();

    return_data.distance = distance(logitude, Lantiide);

    return_data.AvgSpeed = speed(return_data.distance, time);

    return_data.extra_data =
        areYouAhead(return_data.distance, Oldlogitude, OldLantiide);

    return_data.speed = speed(
        Distance()(
            LatLng(
                Lantiide[Lantiide.length - 2], logitude[logitude.length - 2]),
            LatLng(
                Lantiide[Lantiide.length - 1], logitude[logitude.length - 1])),
        time / Lantiide.length);

    return return_data;
  }

  double distance(List<double> logitude, List<double> Lantiide) {
    double totalDistance = 0;

    for (int where = 0; where < logitude.length; where++) {
      try {
        totalDistance = Distance()(LatLng(Lantiide[where], logitude[where]),
                LatLng(Lantiide[where + 1], logitude[where + 1])) +
            totalDistance;
      } catch (_) {
        return totalDistance;
      }
    }
    return totalDistance;
  }

  double speed(double distance, double time) {
    double first = distance / time;

    return first * 2.237 * 3600;
  }

  bro_this_return_a_class_use_ahead_and_are_you_ahead areYouAhead(
      double newDistance, List<double> Oldlogitude, List<double> OldLantiide) {
    bro_this_return_a_class_use_ahead_and_are_you_ahead return_data =
        bro_this_return_a_class_use_ahead_and_are_you_ahead();

    double ghost = distance(Oldlogitude, OldLantiide);

    return_data.are_you_ahead = newDistance > ghost;

    switch (return_data.are_you_ahead) {
      case true:
        {
          return_data.ahead = newDistance - ghost;
        }
        break;
      default:
        {
          return_data.ahead = ghost - newDistance;
        }
        break;
    }
    return return_data;
  }
}
