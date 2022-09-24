import 'dart:math';
import 'package:latlong2/latlong.dart';

void main() {
  List<double> logitude = [23, 25, 29];
  List<double> Lantiide = [23, 25, 29];
  print(find().distance(logitude, Lantiide));
}

class find {
  double distance(List<double> logitude, List<double> Lantiide) {
    var math = Distance();
    double totalDistance = 0;
    for (int where = 0; where < logitude.length; where = where + 2) {
      totalDistance =
          math(LatLng(Lantiide[where],  logitude[where]), LatLng(51.519475, 7.46694444)) +
              totalDistance;
    }

    return totalDistance;
  }

  int speed(List a) {
    return 0;
  }
}
