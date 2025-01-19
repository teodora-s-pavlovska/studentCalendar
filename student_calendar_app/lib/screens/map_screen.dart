import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:student_calendar_app/model/place.dart';

class MapPage extends StatelessWidget {
  final Place destination;

  const MapPage({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(destination.name)),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(destination.latitude, destination.longitude),
          zoom: 14,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('destination'),
            position: LatLng(destination.latitude, destination.longitude),
          )
        },
      ),
    );
  }
}
