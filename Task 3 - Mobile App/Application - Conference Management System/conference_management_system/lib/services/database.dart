import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conference_management_system/models/conference.dart';
import 'package:conference_management_system/models/day.dart';
import 'package:conference_management_system/models/session.dart';
import 'package:conference_management_system/models/person.dart';
import 'package:conference_management_system/models/paper.dart';
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

  //* Conference list from snapshot
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
  Future<List<Session>> fetchSessions(String conferenceId, String dayId) async {
    try {
      QuerySnapshot snapshot = await conferencesCollection
          .doc(conferenceId)
          .collection('days')
          .doc(dayId)
          .collection('sessions')
          .get();

      if (snapshot.docs.isEmpty) {
        return [];
      }

      return snapshot.docs.map((doc) => Session.fromFirestore(doc)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<Paper>> fetchPapers(List<String> paperIds) async {
    try {
      List<Future<Paper>> futures = paperIds.map((paperId) {
        return papersCollection
            .doc(paperId)
            .get()
            .then((doc) => Paper.fromFirestore(doc));
      }).toList();

      return await Future.wait(futures);
    } catch (e) {
      return [];
    }
  }

  Future<List<Paper>> fetchPapersByAuthor(String authorId) async {
    List<Paper> papers = [];
    QuerySnapshot querySnapshot =
        await papersCollection.where('authors', arrayContains: authorId).get();

    papers = querySnapshot.docs.map((doc) => Paper.fromFirestore(doc)).toList();

    return papers;
  }

  Future<List<Paper>> fetchPapersByKeyword(String keywordId) async {
    List<Paper> papers = [];

    QuerySnapshot querySnapshot = await papersCollection
        .where('keywords', arrayContains: keywordId)
        .get();

    papers = querySnapshot.docs.map((doc) => Paper.fromFirestore(doc)).toList();

    return papers;
  }

  Future<List<Person>> fetchAuthorsByPaper(List<String> personIds) async {
    try {
      List<Future<Person>> futures = personIds.map((personId) {
        return personsCollection
            .doc(personId)
            .get()
            .then((doc) => Person.fromFirestore(doc));
      }).toList();

      return await Future.wait(futures);
    } catch (e) {
      return [];
    }
  }

  Future<List<Person>> fetchAllAuthors() async {
    return await fetchDocuments<Person>(
        personsCollection, Person.fromFirestore);
  }

  Future<List<Keyword>> fetchKeywords(List<String> keywordIds) async {
    try {
      List<Future<Keyword>> futures = keywordIds.map((keywordId) {
        return keywordsCollection
            .doc(keywordId)
            .get()
            .then((doc) => Keyword.fromFirestore(doc));
      }).toList();

      return await Future.wait(futures);
    } catch (e) {
      return [];
    }
  }

  Future<List<Keyword>> fetchAllKeywords() async {
    return await fetchDocuments<Keyword>(
        keywordsCollection, Keyword.fromFirestore);
  }

  //* Generic Fetch Method
  Future<List<T>> fetchDocuments<T>(CollectionReference collection,
      T Function(DocumentSnapshot doc) fromFirestore) async {
    try {
      QuerySnapshot snapshot = await collection.get();
      return snapshot.docs.map((doc) => fromFirestore(doc)).toList();
    } catch (e) {
      return [];
    }
  }

  //* Fetch Methods for New Models
  Future<List<Person>> fetchChairPersons(List<String> chairPersonsIds) async {
    try {
      List<Future<Person>> futures = chairPersonsIds.map((chairPersonId) {
        return personsCollection
            .doc(chairPersonId)
            .get()
            .then((doc) => Person.fromFirestore(doc));
      }).toList();

      return await Future.wait(futures);
    } catch (e) {
      return [];
    }
  }
}
