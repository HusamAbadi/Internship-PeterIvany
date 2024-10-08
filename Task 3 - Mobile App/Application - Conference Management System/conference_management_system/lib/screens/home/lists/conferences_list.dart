import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ConferencesList extends StatefulWidget {
  const ConferencesList({super.key});

  @override
  State<ConferencesList> createState() => _ConferencesListState();
}

class _ConferencesListState extends State<ConferencesList> {
  @override
  Widget build(BuildContext context) {
    final conferences = Provider.of<QuerySnapshot>(context);
    // print(favoritePapers.docs);
    for (var doc in conferences.docs) {
      print(doc.data());
    }
    return const Placeholder();
  }
}
