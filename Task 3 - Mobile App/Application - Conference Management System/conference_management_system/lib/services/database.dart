import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conference_management_system/models/conference.dart';
import 'package:conference_management_system/models/day.dart';
import 'package:conference_management_system/models/session.dart';
import 'package:conference_management_system/models/person.dart';
import 'package:conference_management_system/models/paper.dart';
import 'package:conference_management_system/models/user.dart';
import 'package:conference_management_system/models/keyword.dart';

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

  // conference list from snapshot
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
        id: doc.id,
        date: (data['date'] as Timestamp).toDate(),
        endTime: (data['endTime'] as Timestamp).toDate(),
        sessions: List<DocumentReference>.from(data['sessions'] ?? []),
      );
    }).toList();
  }

  /// Stream for days sub-collection in a specific conference document
  Stream<List<Day>> daysStream(String conferenceId) {
    return conferencesCollection
        .doc(conferenceId)
        .collection('days')
        .snapshots()
        .map(_dayListFromSnapshot);
  }

  Future<List<Session>> fetchSessions(String conferenceId, String dayId) async {
    try {
      QuerySnapshot snapshot = await sessionsCollection
          .where('conferenceId', isEqualTo: conferenceId)
          .where('dayId', isEqualTo: dayId)
          .get();

      // Check if the snapshot has data
      if (snapshot.docs.isEmpty) {
        print(
            'No sessions found for conferenceId: $conferenceId and dayId: $dayId');
        return []; // Return an empty list if no documents were found
      }

      // If there are documents, map them to the Session model
      print(
          'Fetched ${snapshot.docs.length} sessions for conferenceId: $conferenceId and dayId: $dayId');
      return snapshot.docs.map((doc) => Session.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error fetching sessions: $e'); // Log the error
      return []; // Return an empty list if there's an error
    }
  }

  //* Fetch Methods for New Models

  // Fetch a single Person document
  Future<Person> fetchPerson(String personId) async {
    DocumentSnapshot doc = await personsCollection.doc(personId).get();
    return Person.fromFirestore(doc);
  }

  // Fetch a single Paper document
  Future<Paper> fetchPaper(String paperId) async {
    DocumentSnapshot doc = await papersCollection.doc(paperId).get();
    return Paper.fromFirestore(doc);
  }

  // Fetch a single User document
  Future<AppUser> fetchUser(String userId) async {
    DocumentSnapshot doc = await usersCollection.doc(userId).get();
    return AppUser.fromFirestore(doc);
  }

  // Fetch a single Keyword document
  Future<Keyword> fetchKeyword(String keywordId) async {
    DocumentSnapshot doc = await keywordsCollection.doc(keywordId).get();
    return Keyword.fromFirestore(doc);
  }

  Future<void> addUserFavoritePaper(String paperId) async {
    // implementation to add a favorite paper to the user's data in Firestore
  }
}
