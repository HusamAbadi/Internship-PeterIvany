import 'package:conference_management_system/models/day.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayTile extends StatelessWidget {
  final Day day;

  const DayTile({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Date: ${DateFormat('EEEE, yyyy-MM-dd').format(day.date)}'),
      subtitle: Text('Sessions: '),
      // onTap: () {
      // },
    );
  }
}
