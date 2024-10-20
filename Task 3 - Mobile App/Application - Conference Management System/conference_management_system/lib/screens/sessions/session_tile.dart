import 'package:conference_management_system/models/conference.dart';
import 'package:conference_management_system/models/session.dart';
import 'package:conference_management_system/screens/papers/papers_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SessionTile extends StatelessWidget {
  final Conference conference;
  final Session session;

  const SessionTile({
    super.key,
    required this.session,
    required this.conference,
  });

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    // Determine the status of the session based on the current time
    Color circleColor;
    if (now.isBefore(session.startTime)) {
      circleColor = Colors.orange; // Session is upcoming
    } else if (now.isAfter(session.endTime)) {
      circleColor = Colors.red; // Session has ended
    } else {
      circleColor = Colors.green; // Session is ongoing
    }

    // Use DateFormat to format the start and end times
    String formattedStartTime = DateFormat('hh:mm a').format(session.startTime);
    String formattedEndTime = DateFormat('hh:mm a').format(session.endTime);

    return Card(
      margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25.0,
          backgroundColor: circleColor, // Set the color based on the status
        ),
        title: Text(session.title),
        subtitle:
            Text('$formattedStartTime - $formattedEndTime'), // Show only time
        onTap: () {
          // print(session.papers);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PapersScreen(session: session),
            ),
          );
        },
      ),
    );
  }
}
