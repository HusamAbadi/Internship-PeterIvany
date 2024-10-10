import 'package:conference_management_system/screens/home/conferences/days/days_screen.dart';
import 'package:flutter/material.dart';
import 'package:conference_management_system/models/conference.dart';
import 'package:intl/intl.dart';

class ConferenceTile extends StatelessWidget {
  final Conference conference;

  ConferenceTile({required this.conference});

  @override
  Widget build(BuildContext context) {
    // Use DateFormat to format the start and end dates to include day of the week
    String formattedStartDate =
        DateFormat('EEEE, yyyy-MM-dd').format(conference.startDate);
    String formattedEndDate =
        DateFormat('EEEE, yyyy-MM-dd').format(conference.endDate);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: const CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.amber,
          ),
          title: Center(child: Text(conference.name)), // Center title
          subtitle: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center align the subtitle
            mainAxisSize: MainAxisSize.min, // Minimize size to fit content
            children: [
              Text(conference.location),
              SizedBox(height: 4), // Adds some space between lines
              Text(
                  'Start: $formattedStartDate'), // Display date with day of the week
              Text(
                  'End: $formattedEndDate'), // Display date with day of the week
            ],
          ),
          // When the tile is tapped, navigate to the ConferenceDetailsScreen
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DaysScreen(conference: conference),
              ),
            );
          },
        ),
      ),
    );
  }
}
