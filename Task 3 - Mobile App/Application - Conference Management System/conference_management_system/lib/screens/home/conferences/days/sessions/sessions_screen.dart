import 'package:conference_management_system/models/conference.dart';
import 'package:conference_management_system/models/day.dart';
import 'package:conference_management_system/models/session.dart';
import 'package:conference_management_system/screens/home/conferences/days/sessions/sessions_list.dart';
import 'package:conference_management_system/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SessionsScreen extends StatelessWidget {
  final Day day;
  final Conference conference;

  const SessionsScreen(
      {super.key, required this.day, required this.conference});

  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<Session>?>(
      create: (context) => DatabaseService(uid: 'uid').sessionsFuture(
          conference.id, day.id), // Provide the future from the database
      initialData: null, // Set the initial data to null
      child: Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          backgroundColor: Colors.amber[400],
          title: Text('Sessions for ${day.date}'),
        ),
        body: Column(
          children: [
            const SizedBox(height: 50.0),
            const Center(
              child: Text(
                'Sessions',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 40.0),
            Expanded(
              child: SessionsList(
                conference: conference,
                day: day,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
