// Model class for Day
import 'package:cloud_firestore/cloud_firestore.dart';

class Day {
  final DateTime date;
  final List<DocumentReference> sessions; // References to session documents

  Day({
    required this.date,
    required this.sessions,
  });

  // Convert Firestore document to Day object
  factory Day.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Day(
      date: (data['date'] as Timestamp).toDate(),
      sessions: List<DocumentReference>.from(data['sessions']),
    );
  }

  // Convert Day object to Firestore document
  Map<String, dynamic> toFirestore() {
    return {
      'date': Timestamp.fromDate(date),
      'sessions': sessions,
    };
  }
}
