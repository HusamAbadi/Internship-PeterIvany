import 'package:cloud_firestore/cloud_firestore.dart';

class Session {
  final String id;
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final String location;
  final bool isBreak;
  final List<DocumentReference> papers;
  // final List<DocumentReference> chairPersons;

  Session({
    required this.id,
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.isBreak,
    required this.papers,
    // required this.chairPersons,
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
      papers: List<DocumentReference>.from(data['papers'] ?? []),
      // chairPersons: List<DocumentReference>.from(data['chairPersons'] ?? []),
    );
  }

  // Static method to convert a list of documents from Firestore to a list of Session objects
  // static List<Session> fromQuerySnapshot(QuerySnapshot snapshot) {
  //   return snapshot.docs.map((doc) => Session.fromFirestore(doc)).toList();
  // }
}
