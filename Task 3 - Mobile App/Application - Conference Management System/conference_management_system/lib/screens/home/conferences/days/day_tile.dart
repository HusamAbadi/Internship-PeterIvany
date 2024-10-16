import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conference_management_system/models/conference.dart';
import 'package:conference_management_system/models/day.dart';
import 'package:conference_management_system/screens/home/conferences/days/sessions/sessions_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayTile extends StatelessWidget {
  final Day day;
  final Conference conference;
  final int increment;

  const DayTile(
      {super.key,
      required this.day,
      required this.conference,
      required this.increment});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    // Determine the status of the day based on the current date and time
    Color circleColor;
    if (now.isBefore(day.date)) {
      circleColor = Colors.orange; // Day is upcoming
    } else if (now.isAfter(day.endTime)) {
      circleColor = Colors.red; // Day has ended
    } else {
      circleColor = Colors.green; // Day is ongoing
    }

    return Column(
      children: [
        Text("Day $increment"), // Display the increment
        Card(
          margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: circleColor, // Set the color based on the status
            ),
            title: Text('${DateFormat('EEEE, dd-MM-yyyy').format(day.date)}'),
            subtitle: Text(
              '${DateFormat('hh:mm a').format(day.date)} - ${DateFormat('hh:mm a').format(day.endTime)}',
            ),
            onTap: () {
              print(day.sessions);
              // Navigate to the SessionsScreen when the day is tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SessionsScreen(
                    day: day,
                    conference: conference,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20.0)
      ],
    );
  }
}
