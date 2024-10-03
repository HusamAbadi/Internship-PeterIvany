import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  // collection reference
  final CollectionReference favoritePapersCollection =
      FirebaseFirestore.instance.collection('Favorite Papers');

  Future updateFavoritePapers(String title, String abstractText) async {
    return await favoritePapersCollection
        .doc(uid)
        .set({'title': title, 'abstractText': abstractText});
  }
}
