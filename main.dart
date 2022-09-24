import 'dart:math';
import 'package:latlong2/latlong.dart';

void main() {
  List<double> logitude = [23, 25, 29];
  List<double> Lantiide = [40, 42, 46];
  print(find().distance(logitude, Lantiide));
}

class find {
  double distance(List<double> logitude, List<double> Lantiide) {
    var math = Distance();
    double totalDistance = 0;
    int where = 0;
    try {
      while (where < logitude.length) {
        totalDistance = math(LatLng(Lantiide[where], logitude[where]),
                LatLng(Lantiide[where + 1], logitude[where + 1])) +
            totalDistance;
        where++;
      }
    } catch (_) {
      totalDistance = math(LatLng(Lantiide[where], logitude[where]),
              LatLng(Lantiide[where - 1], logitude[where - 1])) +
          totalDistance;
    }

    return totalDistance;
  }

  int speed(List a) {
    return 0;
  }
}
