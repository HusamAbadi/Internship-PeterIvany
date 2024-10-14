import 'package:cloud_firestore/cloud_firestore.dart';

class Day {
  final String id;
  final DateTime date;
  final DateTime endTime;
  final List<DocumentReference> sessions; // Array of references to sessions

  Day({
    required this.id,
    required this.date,
    required this.endTime,
    required this.sessions,
  });

  // Factory method to create a day from a Firestore document
  factory Day.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Day(
      id: doc.id,
      date: (data['date'] as Timestamp).toDate(),
      endTime: (data['endTime'] as Timestamp).toDate(),
      sessions: List<DocumentReference>.from(data['sessions'] ?? []),
    );
  }
}
