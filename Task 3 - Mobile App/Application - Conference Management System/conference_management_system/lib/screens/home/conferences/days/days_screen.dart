import 'package:conference_management_system/models/day.dart';
import 'package:conference_management_system/screens/home/conferences/days/days_list.dart';
import 'package:conference_management_system/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DaysScreen extends StatelessWidget {
  final String conferenceId;

  const DaysScreen({Key? key, required this.conferenceId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Day>?>.value(
      value: DatabaseService(uid: 'uid')
          .daysStream(conferenceId), // Provide conference ID
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          backgroundColor: Colors.amber[400],
          title: const Text('Days Screen'),
        ),
        body: Column(
          children: [
            const SizedBox(height: 50.0),
            const Center(
              child: Text(
                'Days',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 40.0),
            Expanded(
              child: DaysList(
                  conferenceId:
                      conferenceId), // Pass the conferenceId to the DaysList
            ),
          ],
        ),
      ),
    );
  }
}
