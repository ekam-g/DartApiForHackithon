import 'package:latlong2/latlong.dart';

void main() {
  List<double> logitude = [23, 24, 25];
  List<double> Lantiide = [40, 41, 42];
  List<double> Oldlogitude = [23, 24, 26];
  List<double> OldLantiide = [40, 41, 42];
  print(find().distance(logitude, Lantiide));
  print(find().speed(logitude, Lantiide));
  var cool = find().areYouAhead(logitude, Lantiide, Oldlogitude, OldLantiide);
  print(cool.ahead);
  print(cool.are_you_ahead);

}

class bro_this_return_a_class_use_ahead_and_are_you_ahead {
  late double ahead;
  late bool are_you_ahead;
}

class find {
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

  double speed(
    List<double> logitude,
    List<double> Lantiide,
  ) {
    return distance(logitude, Lantiide) / logitude.length.toDouble();
  }

  bro_this_return_a_class_use_ahead_and_are_you_ahead areYouAhead(
      List<double> logitude,
      List<double> Lantiide,
      List<double> Oldlogitude,
      List<double> OldLantiide) {
    var return_data = bro_this_return_a_class_use_ahead_and_are_you_ahead();
    double new_distance = distance(logitude, Lantiide);
    double ghost = distance(Oldlogitude, OldLantiide);
    return_data.are_you_ahead = new_distance > ghost;
    switch (return_data.are_you_ahead) {
      case true:
        {
          return_data.ahead = new_distance - ghost;
        }
        break;
      default:
        {
          return_data.ahead = ghost - new_distance;
        }
        break;
    }
    return return_data;
  }
}
