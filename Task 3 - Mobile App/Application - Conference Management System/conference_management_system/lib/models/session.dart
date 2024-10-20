import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conference_management_system/models/paper.dart';

class Session {
  final String id;
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final String location;
  final bool isBreak;
  final List<String> papers;
  final List<String> chairPersons;

  Session({
    required this.id,
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.isBreak,
    required this.papers,
    required this.chairPersons,
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
      papers: List<String>.from(data['papers'] ?? []),
      chairPersons: List<String>.from(
          data['chairPersons'] ?? []), // Map the papers references
    );
  }
}
