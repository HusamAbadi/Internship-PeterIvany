import 'package:conference_management_system/models/conference.dart';
import 'package:conference_management_system/screens/home/conference_tile.dart';
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
    final conferences = Provider.of<List<Conference>?>(context);

    return ListView.builder(
      itemCount: conferences?.length,
      itemBuilder: (context, index) {
        return ConferenceTile(conference: conferences![index]);
      },
    );
  }
}
