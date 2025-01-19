import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/exam_event.dart';

class FirestoreService {
  final CollectionReference _eventsCollection =
      FirebaseFirestore.instance.collection('exam_events');

  Future<List<ExamEvent>> retrieveEvents() async {
    final snapshot = await _eventsCollection.get();
    return snapshot.docs
        .map((doc) =>
            ExamEvent.fromFirestore(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
