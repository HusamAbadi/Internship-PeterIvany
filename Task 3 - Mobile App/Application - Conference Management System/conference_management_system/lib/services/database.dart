import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conference_management_system/models/conference.dart';
import 'package:conference_management_system/models/day.dart';
import 'package:conference_management_system/models/session.dart';
import 'package:conference_management_system/models/person.dart';
import 'package:conference_management_system/models/paper.dart';
import 'package:conference_management_system/models/user.dart';
import 'package:conference_management_system/models/keyword.dart';
import 'package:flutter/material.dart';

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
  // Fetch sessions for a specific day
  Future<List<Session>> fetchSessions(String conferenceId, String dayId) async {
    try {
      QuerySnapshot snapshot = await conferencesCollection
          .doc(conferenceId)
          .collection('days')
          .doc(dayId)
          .collection('sessions')
          .get();

      if (snapshot.docs.isEmpty) {
        print(
            'No sessions found for dayId: $dayId in conferenceId: $conferenceId');
        return [];
      }

      return snapshot.docs.map((doc) => Session.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error fetching sessions: $e');
      return [];
    }
  }

  // Fetch papers based on their document IDs
  Future<List<Paper>> fetchPapers(List<String> paperIds) async {
    List<Paper> papers = [];
    try {
      for (var paperId in paperIds) {
        DocumentSnapshot doc = await papersCollection.doc(paperId).get();
        papers.add(Paper.fromFirestore(doc));
      }
    } catch (e) {
      print('Error fetching papers: $e');
    }
    return papers;
  }

  Future<List<Paper>> fetchPapersByAuthor(String authorId) async {
    List<Paper> papers = [];

    // Query the papers collection where the authors array contains the given authorId
    QuerySnapshot querySnapshot =
        await papersCollection.where('authors', arrayContains: authorId).get();

    // Loop through each document and convert it into a Paper object
    for (var doc in querySnapshot.docs) {
      papers.add(Paper.fromFirestore(doc));
    }

    return papers;
  }

  Future<List<Paper>> fetchPapersByKeyword(String keywordId) async {
    List<Paper> papers = [];

    // Query the papers collection where the authors array contains the given authorId
    QuerySnapshot querySnapshot = await papersCollection
        .where('keywords', arrayContains: keywordId)
        .get();

    // Loop through each document and convert it into a Paper object
    for (var doc in querySnapshot.docs) {
      papers.add(Paper.fromFirestore(doc));
    }

    return papers;
  }

  Future<List<Person>> fetchAuthorsByPaper(List<String> personIds) async {
    List<Person> persons = [];
    try {
      for (var personId in personIds) {
        DocumentSnapshot doc = await personsCollection.doc(personId).get();
        persons.add(Person.fromFirestore(doc));
      }
    } catch (e) {
      print('Error fetching Authors: $e');
    }
    return persons;
  }

  Future<List<Person>> fetchAllAuthors() async {
    try {
      QuerySnapshot snapshot = await personsCollection.get();
      if (snapshot.docs.isEmpty) {
        return [];
      }

      return snapshot.docs.map((doc) => Person.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error fetching sessions: $e');
      return [];
    }
  }

  Future<List<Keyword>> fetchKeywords(List<String> keywordsIds) async {
    List<Keyword> keywords = [];
    try {
      for (var keywordId in keywordsIds) {
        DocumentSnapshot doc = await keywordsCollection.doc(keywordId).get();
        keywords.add(Keyword.fromFirestore(doc));
      }
    } catch (e) {
      print('Error fetching Authors: $e');
      return [];
    }
    return keywords;
  }

  Future<List<Keyword>> fetchAllKeywords() async {
    try {
      QuerySnapshot snapshot = await keywordsCollection.get();
      if (snapshot.docs.isEmpty) {
        return [];
      }
      return snapshot.docs.map((doc) => Keyword.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error fetching sessions: $e');
      return [];
    }
  }
  //* Fetch Methods for New Models

  Future<List<Person>> fetchChairPersons(List<String> chairPersonsIds) async {
    List<Person> persons = [];
    try {
      for (var chairPersonId in chairPersonsIds) {
        DocumentSnapshot doc = await personsCollection.doc(chairPersonId).get();
        persons.add(Person.fromFirestore(doc));
      }
    } catch (e) {
      print('Error fetching chairPersons: $e');
    }
    return persons;
  }

  // Future<AppUser> fetchUser(String userId) async {
  //   DocumentSnapshot doc = await usersCollection.doc(userId).get();
  //   return AppUser.fromFirestore(doc);
  // }

  // Future<void> addUserFavoritePaper(String paperId) async {
  //   // implementation to add a favorite paper to the user's data in Firestore
  // }
}
