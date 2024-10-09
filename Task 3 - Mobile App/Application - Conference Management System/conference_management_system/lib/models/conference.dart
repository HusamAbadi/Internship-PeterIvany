// Model class for Conference
import 'package:cloud_firestore/cloud_firestore.dart';

class Conference {
  final String id;
  final String name;
  final String location;
  final DateTime startDate;
  final DateTime endDate;
  final List<DocumentReference> days; // References to day documents

  Conference({
    required this.id,
    required this.name,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.days,
  });

  // // Convert Firestore document to Conference object
  // factory Conference.fromFirestore(DocumentSnapshot doc) {
  //   Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //   return Conference(
  //     id: doc.id,
  //     name: data['name'],
  //     location: data['location'],
  //     startDate: (data['startDate'] as Timestamp).toDate(),
  //     endDate: (data['endDate'] as Timestamp).toDate(),
  //     days: List<DocumentReference>.from(data['days']),
  //   );
  // }

  // Convert Conference object to Firestore document
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'location': location,
      'startDate': startDate,
      'endDate': endDate,
      'days': days,
    };
  }
}
