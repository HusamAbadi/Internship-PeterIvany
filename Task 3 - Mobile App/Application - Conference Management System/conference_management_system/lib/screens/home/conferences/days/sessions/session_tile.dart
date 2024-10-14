import 'package:conference_management_system/models/session.dart'; // Use the Session model
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SessionTile extends StatelessWidget {
  final Session session; // The session object

  const SessionTile({Key? key, required this.session}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String sessionTitle = session.title;
    DateTime startTime = session.startTime;
    DateTime endTime = session.endTime;

    // Determine the session status based on the current time
    DateTime now = DateTime.now();
    Color tileColor;
    if (now.isBefore(startTime)) {
      tileColor = Colors.orange; // Session is upcoming
    } else if (now.isAfter(endTime)) {
      tileColor = Colors.red; // Session has ended
    } else {
      tileColor = Colors.green; // Session is ongoing
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25.0,
          backgroundColor: tileColor, // Color based on session status
        ),
        title: Text(sessionTitle),
        subtitle: Text(
          '${DateFormat('hh:mm a').format(startTime)} - ${DateFormat('hh:mm a').format(endTime)}',
        ),
      ),
    );
  }
}
