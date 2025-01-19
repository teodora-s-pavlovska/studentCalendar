import 'package:geolocator/geolocator.dart';

class LocationManager {
  Future<Position> getUserLocation() async {
    bool locationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!locationEnabled) {
      throw Exception('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied.');
    }

    return Geolocator.getCurrentPosition();
  }
}
