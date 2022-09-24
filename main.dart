import 'package:latlong2/latlong.dart';

const ms_to_mph = 2.237;

void main() {
  List<double> logitude = [23, 24, 25];
  List<double> Lantiide = [40, 41, 42];
  List<double> Oldlogitude = [23, 24, 26];
  List<double> OldLantiide = [40, 41, 42];
  var cool = Ai().main(logitude, Lantiide, Oldlogitude, OldLantiide, 8000);
  print(cool.speed);
  print(cool.distance);
  print(cool.extra_data.ahead);
  print(cool.extra_data.are_you_ahead);
}

class bro_this_return_a_class_use_ahead_and_are_you_ahead {
  late double ahead;
  late bool are_you_ahead;
}

class bro_this_return_a_class {
  late double distance;
  late double speed;
  late bro_this_return_a_class_use_ahead_and_are_you_ahead extra_data;
}

class Ai {
  bro_this_return_a_class main(List<double> logitude, List<double> Lantiide,
      List<double> Oldlogitude, List<double> OldLantiide, double time) {
    bro_this_return_a_class return_data = bro_this_return_a_class();
    return_data.distance = distance(logitude, Lantiide);
    return_data.speed = speed(return_data.distance, time);
    return_data.extra_data =
        areYouAhead(return_data.distance, Oldlogitude, OldLantiide);
    return return_data;
  }

  double distance(List<double> logitude, List<double> Lantiide) {
    var math = Distance();
    double totalDistance = 0;

    for (int where = 0; where < logitude.length; where++) {
      try {
        totalDistance = math(LatLng(Lantiide[where], logitude[where]),
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
    return first * ms_to_mph;
  }

  bro_this_return_a_class_use_ahead_and_are_you_ahead areYouAhead(
      double newDistance, List<double> Oldlogitude, List<double> OldLantiide) {
    var return_data = bro_this_return_a_class_use_ahead_and_are_you_ahead();
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
