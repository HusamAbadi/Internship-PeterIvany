import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  final String id;
  final String name;
  final List<DocumentReference> sessionsPresenting; // References to sessions
  final List<DocumentReference> papers; // References to papers

  Person({
    required this.id,
    required this.name,
    required this.sessionsPresenting,
    required this.papers,
  });

  // Factory method to create a Person from Firestore document
  factory Person.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Person(
      id: doc.id,
      name: data['name'] ?? '',
      sessionsPresenting:
          List<DocumentReference>.from(data['sessionsPresenting'] ?? []),
      papers: List<DocumentReference>.from(data['papers'] ?? []),
    );
  }
}
