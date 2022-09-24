import 'dart:math';
import 'package:latlong2/latlong.dart';

void main() {
  List<double> logitude = [23, 24, 25];
  List<double> Lantiide = [40, 41, 42];
  print(find().distance(logitude, Lantiide));
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

  int speed(List a) {
    return 0;
  }
}
