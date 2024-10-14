import 'package:cloud_firestore/cloud_firestore.dart';

class Paper {
  final String id;
  final String title;
  final String abstract;
  final List<DocumentReference> authors; // References to persons
  final List<DocumentReference> keywords; // References to keywords

  Paper({
    required this.id,
    required this.title,
    required this.abstract,
    required this.authors,
    required this.keywords,
  });

  // Factory method to create a Paper from Firestore document
  factory Paper.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Paper(
      id: doc.id,
      title: data['title'] ?? '',
      abstract: data['abstract'] ?? '',
      authors: List<DocumentReference>.from(data['authors'] ?? []),
      keywords: List<DocumentReference>.from(data['keywords'] ?? []),
    );
  }
}
