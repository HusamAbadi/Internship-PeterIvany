import 'package:conference_management_system/models/conference.dart';
import 'package:conference_management_system/screens/home/conferences/conferences_list.dart';
import 'package:conference_management_system/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConferencesScreen extends StatelessWidget {
  const ConferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Conference>?>.value(
        value: DatabaseService(uid: 'uid').conferences,
        initialData: null,
        child: Scaffold(
          backgroundColor: Colors.amber[100],
          appBar: AppBar(
            backgroundColor: Colors.amber[400],
            title: const Text('Conferences Screen'),
          ),
          body: const Column(
            children: [
              SizedBox(height: 50.0),
              Center(
                child: Text(
                  'Your Conferences',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(height: 40.0),
              Expanded(
                child: ConferencesList(),
              ),
            ],
          ),
        ));
  }
}
