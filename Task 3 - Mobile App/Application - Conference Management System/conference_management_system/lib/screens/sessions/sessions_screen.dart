import 'package:conference_management_system/models/conference.dart';
import 'package:conference_management_system/models/day.dart';
import 'package:conference_management_system/models/session.dart';
import 'package:conference_management_system/screens/sessions/sessions_list.dart';
import 'package:conference_management_system/services/database.dart';
import 'package:conference_management_system/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SessionsScreen extends StatelessWidget {
  final Day day;
  final Conference conference;
  final int dayIncrement;

  const SessionsScreen({
    super.key,
    required this.day,
    required this.conference,
    required this.dayIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<Session>?>(
      create: (context) => DatabaseService(uid: 'uid').fetchSessions(
        conference.id,
        day.id,
      ),
      initialData: null,
      child: Scaffold(
        backgroundColor: bodyBackgroundColor,
        appBar: AppBar(
          backgroundColor: appBarColor,
          titleTextStyle: titleFontStyle,
          title: const Text("Back to Days Screen"),
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50.0),
        Center(
          child: Text(
            conference.name,
            style: titleFontStyle.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Text("Day ${dayIncrement.toString()}",
            style:
                const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        const SizedBox(height: 40.0),
        Expanded(
          child: Consumer<List<Session>?>(
            builder: (context, sessions, child) {
              if (sessions == null) {
                return const Center(child: CircularProgressIndicator());
              }
              if (sessions.isEmpty) {
                return const Center(
                  child: Text('No sessions available for this day.'),
                );
              }
              return SessionsList(
                sessions: sessions,
                conference: conference,
                day: day,
                dayIncrement: dayIncrement,
              );
            },
          ),
        ),
      ],
    );
  }
}
