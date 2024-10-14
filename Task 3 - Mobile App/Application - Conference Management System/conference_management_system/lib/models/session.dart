import 'package:cloud_firestore/cloud_firestore.dart';

class Session {
  final String id;
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final String location;
  final bool isBreak;
  final List<DocumentReference> chairPersons;
  final List<DocumentReference> papers;

  Session({
    required this.id,
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.isBreak,
    required this.chairPersons,
    required this.papers,
  });

  // Factory method to create a Session from Firestore document
  factory Session.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Session(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      startTime: (data['startTime'] as Timestamp).toDate(),
      endTime: (data['endTime'] as Timestamp).toDate(),
      location: data['location'] ?? '',
      isBreak: data['isBreak'] ?? false,
      chairPersons: List<DocumentReference>.from(data['chairPersons'] ?? []),
      papers: List<DocumentReference>.from(data['papers'] ?? []),
    );
  }
}
