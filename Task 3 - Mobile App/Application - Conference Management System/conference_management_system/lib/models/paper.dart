import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conference_management_system/models/keyword.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Paper {
  final String id;
  final String title;
  final String abstract;
  final List<String> authors;
  final List<String> keywords;

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
      authors: List<String>.from(data['authors'] ?? []),
      keywords: List<String>.from(data['keywords'] ?? []),
    );
  }
}
