import 'package:conference_management_system/models/conference.dart';
import 'package:conference_management_system/models/day.dart';
import 'package:conference_management_system/screens/home/conferences/days/days_list.dart';
import 'package:conference_management_system/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DaysScreen extends StatelessWidget {
  final Conference conference;

  const DaysScreen({Key? key, required this.conference}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Day>?>.value(
      value: DatabaseService(uid: 'uid')
          .daysStream(conference.id), // Provide conference ID
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
            Center(
              child: Text(
                conference.name,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 40.0),
            Expanded(
              child: DaysList(
                  conference:
                      conference), // Pass the conferenceId to the DaysList
            ),
          ],
        ),
      ),
    );
  }
}
