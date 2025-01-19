import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  final LatLng eventLocation = const LatLng(42.0, 21.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Locations'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: eventLocation,
          zoom: 14.0,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('eventLocation'),
            position: eventLocation,
            infoWindow: const InfoWindow(title: 'Exam Location'),
          ),
        },
        onMapCreated: (controller) {
          mapController = controller;
        },
      ),
    );
  }
}
