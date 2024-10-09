// Model class for Session
import 'package:cloud_firestore/cloud_firestore.dart';

class Session {
  final String id;
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final String speaker;

  Session({
    required this.id,
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.speaker,
  });

  // Convert Firestore document to Session object
  factory Session.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Session(
      id: doc.id,
      title: data['title'],
      description: data['description'],
      startTime: (data['startTime'] as Timestamp).toDate(),
      endTime: (data['endTime'] as Timestamp).toDate(),
      speaker: data['speaker'],
    );
  }

  // Convert Session object to Firestore document
  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'description': description,
      'startTime': Timestamp.fromDate(startTime),
      'endTime': Timestamp.fromDate(endTime),
      'speaker': speaker,
    };
  }
}
