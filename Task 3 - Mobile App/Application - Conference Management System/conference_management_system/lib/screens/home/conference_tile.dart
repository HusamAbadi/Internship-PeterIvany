import 'package:flutter/material.dart';
import 'package:conference_management_system/models/conference.dart';

class ConferenceTile extends StatelessWidget {
  final Conference conference;
  ConferenceTile({required this.conference});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: const CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.amber,
          ),
          title: Text(conference.name),
          subtitle: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Aligns text to the left
            children: [
              Text(conference.location),
              SizedBox(height: 4),
              Text(
                  'Start: ${conference.startDate.toLocal().toString().split(' ')[0]}'), // Display date in 'YYYY-MM-DD' format
              Text(
                  'End: ${conference.endDate.toLocal().toString().split(' ')[0]}'), // Display date in 'YYYY-MM-DD' format
            ],
          ),
        ),
      ),
    );
  }
}
