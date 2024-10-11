import 'package:conference_management_system/models/day.dart';
import 'package:conference_management_system/screens/home/conferences/days/days_list.dart';
import 'package:conference_management_system/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DaysScreen extends StatelessWidget {
  final String conferenceId;

  const DaysScreen({super.key, required this.conferenceId});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Day>?>.value(
        value: DatabaseService(uid: 'uid').daysStream(conferenceId),
        initialData: null,
        child: Scaffold(
          backgroundColor: Colors.amber[100],
          appBar: AppBar(
            backgroundColor: Colors.amber[400],
            title: const Text('Days Screen'),
          ),
          body: Column(
            children: [
              SizedBox(height: 50.0),
              const Center(
                child: Text(
                  'Days',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(height: 40.0),
              Expanded(
                child: DaysList(conferenceId: conferenceId),
              ),
            ],
          ),
        ));
  }
}
