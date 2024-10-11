import 'package:conference_management_system/models/day.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayTile extends StatelessWidget {
  final Day day;

  const DayTile({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    // Get the current date and time
    DateTime now = DateTime.now();

    // Determine the status of the day based on the current date and time
    Color circleColor;
    if (now.isBefore(day.date)) {
      // Day is upcoming
      circleColor = Colors.orange;
    } else if (now.isAfter(day.endTime)) {
      // Day has ended
      circleColor = Colors.red;
    } else {
      // Day is currently ongoing
      circleColor = Colors.green;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Card(
            margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundColor:
                    circleColor, // Set the color based on the status
              ),
              title: Text('${DateFormat('EEEE, dd-MM-yyyy').format(day.date)}'),
              subtitle: Text(
                  '${DateFormat('hh:mm a').format(day.date)} - ${DateFormat('hh:mm a').format(day.endTime)}'),
            ),
          ),
        ),
      ],
    );
  }
}
