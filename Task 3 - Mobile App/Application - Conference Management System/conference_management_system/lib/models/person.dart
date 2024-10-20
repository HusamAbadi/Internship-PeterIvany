import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  final String id;
  final String name;
  final List<String> sessionsPresenting; // References to sessions
  final List<String> papers; // References to papers

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
      sessionsPresenting: List<String>.from(data['sessionsPresenting'] ?? []),
      papers: List<String>.from(data['papers'] ?? []),
    );
  }

  // Static method to convert a list of Firestore documents to a list of Person objects
  static List<Person> fromQuerySnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) => Person.fromFirestore(doc)).toList();
  }

  // Static method to fetch all persons from Firestore
  static Future<List<Person>> fetchAllPersons() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('persons').get();
      return fromQuerySnapshot(snapshot);
    } catch (e) {
      print('Error fetching persons: $e');
      return [];
    }
  }

  // // Method to save a new person to Firestore
  // Future<void> saveToFirestore() async {
  //   try {
  //     await FirebaseFirestore.instance.collection('persons').doc(id).set({
  //       'name': name,
  //       'sessionsPresenting': sessionsPresenting,
  //       'papers': papers,
  //     });
  //   } catch (e) {
  //     print('Error saving person: $e');
  //   }
  // }

  // // Method to delete a person from Firestore
  // Future<void> deleteFromFirestore() async {
  //   try {
  //     await FirebaseFirestore.instance.collection('persons').doc(id).delete();
  //   } catch (e) {
  //     print('Error deleting person: $e');
  //   }
  // }

  // // Static method to fetch a person from Firestore by ID
  // static Future<Person?> fetchPersonById(String personId) async {
  //   try {
  //     DocumentSnapshot doc = await FirebaseFirestore.instance
  //         .collection('persons')
  //         .doc(personId)
  //         .get();

  //     if (doc.exists) {
  //       return Person.fromFirestore(doc);
  //     } else {
  //       print('Person not found');
  //       return null;
  //     }
  //   } catch (e) {
  //     print('Error fetching person: $e');
  //     return null;
  //   }
  // }
}
