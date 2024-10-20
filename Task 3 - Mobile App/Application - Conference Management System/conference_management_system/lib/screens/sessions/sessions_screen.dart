import 'package:conference_management_system/models/conference.dart';
import 'package:conference_management_system/models/day.dart';
import 'package:conference_management_system/models/session.dart';
import 'package:conference_management_system/screens/sessions/sessions_list.dart';
import 'package:conference_management_system/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SessionsScreen extends StatelessWidget {
  final Day day;
  final Conference conference;

  const SessionsScreen({
    super.key,
    required this.day,
    required this.conference,
  });

  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<Session>?>(
      create: (context) => DatabaseService(uid: 'uid').fetchSessions(
        conference.id,
        day.id,
      ),
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          backgroundColor: Colors.amber[400],
          title: Text(conference.name),
        ),
        body: Column(
          children: [
            const SizedBox(height: 50.0),
            const Center(
              child: Text(
                "Sessions",
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 40.0),
            Expanded(
              child: Consumer<List<Session>?>(
                builder: (context, sessions, child) {
                  if (sessions == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (sessions.isEmpty) {
                    return const Center(
                      child: Text('No sessions available for this day.'),
                    );
                  }
                  return SessionsList(
                    sessions: sessions,
                    conference: conference,
                    day: day,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
