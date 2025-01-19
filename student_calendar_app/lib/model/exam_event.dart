import 'package:cloud_firestore/cloud_firestore.dart';

import 'place.dart';

class ExamEvent {
  final String identifier;
  final String course;
  final DateTime date;
  final Place venue;

  ExamEvent({
    required this.identifier,
    required this.course,
    required this.date,
    required this.venue,
  });

  factory ExamEvent.fromFirestore(Map<String, dynamic> data) {
    GeoPoint geo = data['venue']['coordinates'];
    return ExamEvent(
      identifier: data['identifier'],
      course: data['course'],
      date: (data['date'] as Timestamp).toDate(),
      venue: Place(
        name: data['venue']['name'],
        latitude: geo.latitude,
        longitude: geo.longitude,
      ),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'identifier': identifier,
      'course': course,
      'date': Timestamp.fromDate(date),
      'venue': venue.toMap(),
    };
  }
}
