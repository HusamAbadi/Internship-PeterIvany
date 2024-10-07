import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class FavoritePapersList extends StatefulWidget {
  const FavoritePapersList({super.key});

  @override
  State<FavoritePapersList> createState() => _FavoritePapersListState();
}

class _FavoritePapersListState extends State<FavoritePapersList> {
  @override
  Widget build(BuildContext context) {
    final favoritePapers = Provider.of<QuerySnapshot>(context);
    // print(favoritePapers.docs);
    for (var doc in favoritePapers.docs) {
      print(doc.data());
    }
    return const Placeholder();
  }
}
