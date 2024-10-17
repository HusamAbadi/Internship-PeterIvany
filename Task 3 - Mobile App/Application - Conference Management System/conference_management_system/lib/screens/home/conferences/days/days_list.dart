import 'package:conference_management_system/models/conference.dart';
import 'package:conference_management_system/screens/home/conferences/days/day_tile.dart';
import 'package:flutter/material.dart';
import 'package:conference_management_system/models/day.dart';
import 'package:provider/provider.dart';

class DaysList extends StatelessWidget {
  final Conference? conference;

  const DaysList({this.conference, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final days = Provider.of<List<Day>?>(context);

    if (days == null) {
      // Show a loading indicator if the days list is null (data is being fetched)
      return Center(child: CircularProgressIndicator());
    }

    if (days.isEmpty) {
      // Show a message if the days list is empty
      return Center(child: Text('No days available for this conference.'));
    }

    // Sort the days list based on the date
    days.sort((a, b) => a.date.compareTo(b.date));

    return ListView.builder(
      itemCount: days.length,
      itemBuilder: (context, index) {
        return DayTile(
          day: days[index],
          conference: conference!,
          increment: index + 1, // Increment based on index
        );
      },
    );
  }
}
