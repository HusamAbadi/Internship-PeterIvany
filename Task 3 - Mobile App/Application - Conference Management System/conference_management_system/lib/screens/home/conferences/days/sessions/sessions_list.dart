import 'package:conference_management_system/models/day.dart';
import 'package:conference_management_system/models/session.dart';
import 'package:conference_management_system/screens/home/conferences/days/sessions/session_tile.dart';
import 'package:flutter/material.dart';

class SessionsList extends StatelessWidget {
  final Day? day;
  final List<Session> sessions;

  const SessionsList({super.key, required this.sessions, this.day});

  @override
  Widget build(BuildContext context) {
    if (sessions.isEmpty) {
      return const Center(child: Text('No sessions available for this day.'));
    }

    return ListView.builder(
      itemCount: sessions.length,
      itemBuilder: (context, index) {
        return SessionTile(session: sessions[index]);
      },
    );
  }
}
