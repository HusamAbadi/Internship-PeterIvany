import 'package:conference_management_system/models/day.dart';
import 'package:conference_management_system/models/session.dart';
import 'package:conference_management_system/screens/home/conferences/days/sessions/sessions_list.dart';
import 'package:conference_management_system/services/database.dart';
import 'package:flutter/material.dart';

class SessionsScreen extends StatefulWidget {
  final Day day;
  final String conferenceId;

  const SessionsScreen(
      {Key? key, required this.day, required this.conferenceId})
      : super(key: key);

  @override
  _SessionsScreenState createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  late Future<List<Session>> sessionsFuture;

  @override
  void initState() {
    super.initState();
    print(
        'Fetching sessions for conferenceId: ${widget.conferenceId} and dayId: ${widget.day.id}');
    sessionsFuture = DatabaseService(uid: 'uid')
        .fetchSessions(widget.conferenceId, widget.day.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sessions for ${widget.day.date}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Session>>(
          future: sessionsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Error loading sessions'));
            }

            // Delegate to SessionsList for empty state and data display
            return SessionsList(sessions: snapshot.data ?? []);
          },
        ),
      ),
    );
  }
}
