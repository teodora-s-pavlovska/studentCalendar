import 'package:cloud_firestore/cloud_firestore.dart';

class Place {
  final String name;
  final double latitude;
  final double longitude;

  Place({
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'coordinates': GeoPoint(latitude, longitude),
    };
  }
}
