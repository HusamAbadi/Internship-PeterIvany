import 'package:conference_management_system/screens/home/conferences/conferences_list.dart';
import 'package:conference_management_system/services/database.dart';
import 'package:flutter/material.dart';
import 'package:conference_management_system/models/conference.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DaysScreen extends StatelessWidget {
  final Conference conference;

  const DaysScreen({required this.conference, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Conference>?>.value(
        value: DatabaseService(uid: 'uid').conferences,
        initialData: null,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Days Screen'),
          ),
          body: Column(
            children: [
              SizedBox(height: 20.0),
              Center(
                child: Text(
                  conference.name,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(height: 40.0),
              const Expanded(
                child: ConferencesList(),
              ),
            ],
          ),
        ));
  }
}
