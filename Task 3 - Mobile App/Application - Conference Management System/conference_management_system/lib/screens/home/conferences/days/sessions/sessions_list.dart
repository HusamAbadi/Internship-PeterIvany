import 'package:conference_management_system/models/conference.dart';
import 'package:conference_management_system/models/day.dart';
import 'package:conference_management_system/models/session.dart';
import 'package:conference_management_system/screens/home/conferences/days/sessions/session_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SessionsList extends StatelessWidget {
  final Day? day;
  final Conference? conference;

  const SessionsList({super.key, this.day, this.conference});

  @override
  Widget build(BuildContext context) {
    final sessions = Provider.of<List<Session>?>(context);

    if (sessions == null) {
      // Show a loading indicator while fetching data
      return const Center(child: CircularProgressIndicator());
    }

    if (sessions.isEmpty) {
      return const Center(child: Text('No sessions available for this day.'));
    }

    // Sort sessions by startTime
    sessions.sort((a, b) => a.startTime.compareTo(b.startTime));

    return ListView.builder(
      itemCount: sessions.length,
      itemBuilder: (context, index) {
        final session = sessions[index];
        return SessionTile(session: session);
      },
    );
    // return SessionTile(session: sessions[0]);
    // return Column(
    //   children: [Text(sessions[0].description)],
    // );
  }
}
