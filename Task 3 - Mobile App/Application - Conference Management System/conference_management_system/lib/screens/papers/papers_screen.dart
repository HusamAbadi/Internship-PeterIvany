import 'package:conference_management_system/models/conference.dart';
import 'package:conference_management_system/models/day.dart';
import 'package:conference_management_system/models/paper.dart';
import 'package:conference_management_system/models/session.dart';
import 'package:conference_management_system/screens/papers/papers_list.dart';
import 'package:conference_management_system/screens/sessions/sessions_list.dart';
import 'package:conference_management_system/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PapersScreen extends StatelessWidget {
  // final Day day;
  final Session session;

  const PapersScreen({
    super.key,
    // required this.day,
    required this.session,
  });

  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<Paper>?>(
      create: (context) =>
          DatabaseService(uid: 'uid').fetchPapers(session.papers),
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          // toolbarHeight: 60.0,
          backgroundColor: Colors.amber[400],
          title: const Text("Papers Screen"),
        ),
        body: Column(
          children: [
            const SizedBox(height: 50.0),
            Center(
              child: Text(
                "Papers for ${session.title}",
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40.0),
            Expanded(
              child: Consumer<List<Paper>?>(
                builder: (context, papers, child) {
                  if (papers == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (papers.isEmpty) {
                    return const Center(
                      child: Text('No papers available for this day.'),
                    );
                  }
                  return PapersList(
                    papers: papers,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
