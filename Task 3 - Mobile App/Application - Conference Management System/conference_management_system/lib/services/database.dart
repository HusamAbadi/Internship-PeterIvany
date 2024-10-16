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

  //* conference list from snapshot
  List<Conference> _conferenceListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Conference.fromFirestore(doc);
    }).toList();
  }

  Stream<List<Conference>> get conferences {
    return conferencesCollection.snapshots().map(_conferenceListFromSnapshot);
  }

  // Days list from snapshot
  List<Day> _dayListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Day.fromFirestore(doc);
    }).toList();
  }

  ///* Stream for days sub-collection in a specific conference document
  Stream<List<Day>> daysStream(String conferenceId) {
    return conferencesCollection
        .doc(conferenceId)
        .collection('days')
        .snapshots()
        .map(_dayListFromSnapshot);
  }

  //* Sessions Stream
  // Add this method to fetch sessions using a Future
  Future<List<Session>> sessionsFuture(
      String conferenceId, String dayId) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('conferences')
        .doc(conferenceId)
        .collection('days')
        .doc(dayId)
        .collection('sessions')
        .get();
    return _sessionsListFromSnapshot(snapshot);
  }

  // Helper function to map Firestore snapshot to List<Session>
  List<Session> _sessionsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Session.fromFirestore(doc);
    }).toList();
  }

  // //* Sessions Stream using helper function
  // Stream<List<Session>> sessionsStream(String conferenceId, String dayId) {
  //   return conferencesCollection
  //       .doc(conferenceId)
  //       .collection('days')
  //       .doc(dayId)
  //       .collection('sessions')
  //       .snapshots()
  //       .map(_sessionsListFromSnapshot);
  // }

  //* Fetch Methods for New Models

  Future<Person> fetchPerson(String personId) async {
    DocumentSnapshot doc = await personsCollection.doc(personId).get();
    return Person.fromFirestore(doc);
  }

  Future<Paper> fetchPaper(String paperId) async {
    DocumentSnapshot doc = await papersCollection.doc(paperId).get();
    return Paper.fromFirestore(doc);
  }

  Future<AppUser> fetchUser(String userId) async {
    DocumentSnapshot doc = await usersCollection.doc(userId).get();
    return AppUser.fromFirestore(doc);
  }

  Future<Keyword> fetchKeyword(String keywordId) async {
    DocumentSnapshot doc = await keywordsCollection.doc(keywordId).get();
    return Keyword.fromFirestore(doc);
  }

  Future<void> addUserFavoritePaper(String paperId) async {
    // implementation to add a favorite paper to the user's data in Firestore
  }
}
