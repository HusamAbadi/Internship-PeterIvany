import 'package:cloud_firestore/cloud_firestore.dart';
import 'session.dart';

class Day {
  final String id;
  final DateTime date;
  final DateTime endTime;
  final List<DocumentReference> sessions;

  Day({
    required this.id,
    required this.date,
    required this.endTime,
    required this.sessions,
  });

  // Factory method to create a Day object from Firestore
  factory Day.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Day(
      id: doc.id,
      date: (data['date'] as Timestamp).toDate(),
      endTime: (data['endTime'] as Timestamp).toDate(),
      sessions: List<DocumentReference>.from(data['sessions'] ?? []),
    );
  }

  // Static method to get a list of Day objects from Firestore snapshots
  static List<Day> fromQuerySnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Day.fromFirestore(doc);
    }).toList();
  }
}
