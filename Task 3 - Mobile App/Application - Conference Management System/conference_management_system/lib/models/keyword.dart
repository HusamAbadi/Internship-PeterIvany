import 'package:cloud_firestore/cloud_firestore.dart';

class Keyword {
  final String id;
  final String name;
  final List<DocumentReference>
      papers; // References to papers related to this keyword

  Keyword({
    required this.id,
    required this.name,
    required this.papers,
  });

  // Factory method to create a Keyword from Firestore document
  factory Keyword.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Keyword(
      id: doc.id,
      name: data['name'] ?? '',
      papers: List<DocumentReference>.from(data['papers'] ?? []),
    );
  }
}
