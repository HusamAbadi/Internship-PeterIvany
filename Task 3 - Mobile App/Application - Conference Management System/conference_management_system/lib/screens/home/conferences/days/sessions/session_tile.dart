import 'package:conference_management_system/models/session.dart';
import 'package:flutter/material.dart';

class SessionTile extends StatelessWidget {
  final Session? session;

  const SessionTile({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    // Determine the status of the day based on the current date and time
    Color circleColor;
    if (now.isBefore(session!.startTime)) {
      circleColor = Colors.orange; // Day is upcoming
    } else if (now.isAfter(session!.endTime)) {
      circleColor = Colors.red; // Day has ended
    } else {
      circleColor = Colors.green; // Day is ongoing
    }

    return Card(
      margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25.0,
          backgroundColor: circleColor, // Set the color based on the status
        ),
        title: Text(session!.title),
        subtitle: Text('${session!.startTime} - ${session!.endTime}'),
        // title: Text("Hi!"),
        // subtitle: Text('Bi!'),
        onTap: () {},
      ),
    );
  }
}
