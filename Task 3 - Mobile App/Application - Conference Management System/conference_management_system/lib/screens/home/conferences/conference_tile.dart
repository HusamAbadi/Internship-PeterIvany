import 'package:conference_management_system/screens/home/conferences/days/days_screen.dart';
import 'package:flutter/material.dart';
import 'package:conference_management_system/models/conference.dart';
import 'package:intl/intl.dart';

class ConferenceTile extends StatelessWidget {
  final Conference conference;

  ConferenceTile({required this.conference});

  @override
  Widget build(BuildContext context) {
    // Use DateFormat to format the start and end dates
    String formattedStartDate =
        DateFormat('EEEE, yyyy-MM-dd').format(conference.startDate);
    String formattedEndDate =
        DateFormat('EEEE, yyyy-MM-dd').format(conference.endDate);

    // Get the current date and time
    DateTime now = DateTime.now();

    // Determine the status of the conference based on the current date and time
    Color circleColor;
    if (now.isBefore(conference.startDate)) {
      // Conference is upcoming
      circleColor = Colors.orange;
    } else if (now.isAfter(conference.endDate)) {
      // Conference has ended
      circleColor = Colors.red;
    } else {
      // Conference is currently running
      circleColor = Colors.green;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: circleColor, // Set the color based on the status
          ),
          title: Center(child: Text(conference.name)), // Center title
          subtitle: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center align the subtitle
            mainAxisSize: MainAxisSize.min, // Minimize size to fit content
            children: [
              Text(conference.location),
              SizedBox(height: 4), // Adds some space between lines
              Text('Start: $formattedStartDate'), // Display date with time
              Text('End: $formattedEndDate'), // Display date with time
            ],
          ),
          // When the tile is tapped, navigate to the DaysScreen
          onTap: () {
            print(conference.id);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DaysScreen(conferenceId: conference.id),
              ),
            );
          },
        ),
      ),
    );
  }
}
