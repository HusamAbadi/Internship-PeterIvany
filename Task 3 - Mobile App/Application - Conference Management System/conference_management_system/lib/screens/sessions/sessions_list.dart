import 'package:conference_management_system/models/conference.dart';
import 'package:conference_management_system/models/day.dart';
import 'package:conference_management_system/models/session.dart';
import 'package:conference_management_system/screens/sessions/session_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SessionsList extends StatelessWidget {
  final Day? day;
  final Conference conference;
  final List<Session> sessions;

  const SessionsList({
    super.key,
    this.day,
    required this.conference,
    required this.sessions,
  });

  @override
  Widget build(BuildContext context) {
    // If sessions are null or empty, show a message
    if (sessions == null || sessions.isEmpty) {
      return const Center(child: Text('No sessions available for this day.'));
    }

    // Sort sessions by start time
    sessions.sort((a, b) => a.startTime.compareTo(b.startTime));

    return ListView.builder(
      itemCount: sessions.length,
      itemBuilder: (context, index) {
        final session = sessions[index];
        return SessionTile(conference: conference, session: session);
      },
    );
  }
}
