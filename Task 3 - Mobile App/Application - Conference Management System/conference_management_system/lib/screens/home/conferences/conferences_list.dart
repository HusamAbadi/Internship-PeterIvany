import 'package:conference_management_system/models/conference.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConferencesList extends StatefulWidget {
  const ConferencesList({super.key});

  @override
  State<ConferencesList> createState() => _ConferencesListState();
}

class _ConferencesListState extends State<ConferencesList> {
  @override
  Widget build(BuildContext context) {
    final conferences = Provider.of<List<Conference>>(context);
    for (var conference in conferences) {
      print(conference.name);
      print(conference.location);
      print(conference.days);
    }
    return const Placeholder();
  }
}
