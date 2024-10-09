import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conference_management_system/models/conference.dart';

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

  // /// Adds a favorite paper to the user's document.
  // /// [paperId] is the ID of the document in the `favoritePapers` collection.
  // Future<void> addUserFavoritePaper(String paperId) async {
  //   // Create a reference to the paper in the `favoritePapers` collection
  //   DocumentReference paperReference = papersCollection.doc(paperId);

  //   // Update the user's document by adding the paper reference to `favoritePapers` array
  //   return await usersCollection.doc(uid).update({
  //     'favoritePapers': FieldValue.arrayUnion([paperReference])
  //   });
  // }

  // /// Removes a favorite paper from the user's document.
  // /// [paperId] is the ID of the document in the `favoritePapers` collection.
  // Future<void> removeUserFavoritePaper(String paperId) async {
  //   // Create a reference to the paper in the `favoritePapers` collection
  //   DocumentReference paperReference = papersCollection.doc(paperId);

  //   // Update the user's document by removing the paper reference from `favoritePapers` array
  //   return await usersCollection.doc(uid).update({
  //     'favoritePapers': FieldValue.arrayRemove([paperReference])
  //   });
  // }
}
