import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conference_management_system/models/conference.dart';
import 'package:conference_management_system/models/day.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  //* Collections' References
  final CollectionReference conferencesCollection =
      FirebaseFirestore.instance.collection('conferences');

  final CollectionReference sessionsCollection =
      FirebaseFirestore.instance.collection('sessions');

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference papersCollection =
      FirebaseFirestore.instance.collection('papers');

  final CollectionReference keywordsCollection =
      FirebaseFirestore.instance.collection('keywords');

  final CollectionReference personsCollection =
      FirebaseFirestore.instance.collection('persons');

  //* Streams

  Stream<DocumentSnapshot> get sessions {
    return sessionsCollection.doc(uid).snapshots();
  }

  Stream<DocumentSnapshot> get users {
    return usersCollection.doc(uid).snapshots();
  }

  Stream<DocumentSnapshot> get papers {
    return papersCollection.doc(uid).snapshots();
  }

  Stream<DocumentSnapshot> get keywords {
    return keywordsCollection.doc(uid).snapshots();
  }

  Stream<DocumentSnapshot> get persons {
    return personsCollection.doc(uid).snapshots();
  }

  //conference list from snapshot
  List<Conference> _conferenceListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Conference(
          id: doc.id,
          name: data['name'] ?? '',
          location: data['location'] ?? '',
          startDate: (data['startDate'] as Timestamp).toDate(),
          endDate: (data['endDate'] as Timestamp).toDate(),
          days: data['days'] ?? []);
    }).toList();
  }

  Stream<List<Conference>> get conferences {
    return conferencesCollection.snapshots().map(_conferenceListFromSnapshot);
  }

  // Days list from snapshot
  List<Day> _dayListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Day(
        date: (data['date'] as Timestamp).toDate(),
        endTime: (data['endTime'] as Timestamp).toDate(),
        // sessions: data['sessions'] ?? [],
      );
    }).toList();
  }

  /// Stream for days sub-collection in a specific conference document
  Stream<List<Day>> daysStream(String conferenceId) {
    return conferencesCollection
        .doc(conferenceId)
        .collection('days')
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isEmpty) {
        print('No days found for conference: $conferenceId');
        return []; // Return an empty list if no documents found
      }
      return _dayListFromSnapshot(snapshot);
    });
  }
}
