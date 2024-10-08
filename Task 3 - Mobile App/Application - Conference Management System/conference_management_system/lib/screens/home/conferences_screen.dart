import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conference_management_system/screens/home/lists/conferences_list.dart';
import 'package:conference_management_system/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConferencesScreen extends StatelessWidget {
  const ConferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
        value: DatabaseService(uid: 'uid').conferences,
        initialData: null,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Conferences Screen'),
          ),
          body: const Column(
            children: [
              Center(
                child: Text(
                  'Your Conferences',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              ConferencesList(),
            ],
          ),
        ));
  }
}
