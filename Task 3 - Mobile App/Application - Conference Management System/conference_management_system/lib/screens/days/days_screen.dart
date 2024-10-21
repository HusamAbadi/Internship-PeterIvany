import 'package:conference_management_system/models/conference.dart';
import 'package:conference_management_system/models/day.dart';
import 'package:conference_management_system/screens/days/days_list.dart';
import 'package:conference_management_system/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DaysScreen extends StatelessWidget {
  final Conference conference;

  const DaysScreen({super.key, required this.conference});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Day>?>.value(
      value: DatabaseService(uid: 'uid')
          .daysStream(conference.id), // Provide conference ID
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          backgroundColor: Colors.amber[400],
          title: Text(
            conference.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              const Center(
                child: Text(
                  "Days",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30.0),
              Expanded(
                child: DaysList(
                    conference: conference), // Pass the conference to DaysList
              ),
            ],
          ),
        ),
      ),
    );
  }
}
