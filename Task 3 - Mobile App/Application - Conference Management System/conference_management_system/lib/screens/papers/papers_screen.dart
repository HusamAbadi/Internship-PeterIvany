import 'package:conference_management_system/models/conference.dart';
import 'package:conference_management_system/models/day.dart';
import 'package:conference_management_system/models/paper.dart';
import 'package:conference_management_system/models/person.dart';
import 'package:conference_management_system/models/session.dart';
import 'package:conference_management_system/screens/papers/papers_list.dart';
import 'package:conference_management_system/screens/sessions/sessions_list.dart';
import 'package:conference_management_system/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PapersScreen extends StatelessWidget {
  final Session? session;
  final Conference? conference;
  final Person? author;

  // Constructor for SessionTile navigation
  const PapersScreen.session({
    super.key,
    required this.session,
    required this.conference,
  }) : author = null;

  // Constructor for AuthorsTile navigation
  const PapersScreen.author({
    super.key,
    required this.author,
  })  : session = null,
        conference = null;

  @override
  Widget build(BuildContext context) {
    if (author != null) {
      // Display papers for the specific author
      return _buildAuthorPapersScreen();
    } else {
      // Display papers for the session and conference
      return _buildSessionPapersScreen();
    }
  }

  Widget _buildSessionPapersScreen() {
    return FutureProvider<List<Paper>?>(
      create: (context) =>
          DatabaseService(uid: 'uid').fetchPapers(session!.papers),
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          backgroundColor: Colors.amber[400],
          title: Text(conference!.name),
        ),
        body: Column(
          children: [
            const SizedBox(height: 50.0),
            Center(
              child: Text(
                "Papers for ${session!.title}",
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
                      child: Text('No papers available for this session.'),
                    );
                  }
                  return PapersList(papers: papers);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthorPapersScreen() {
    return FutureProvider<List<Paper>?>(
      create: (context) =>
          DatabaseService(uid: 'uid').fetchPapersByAuthor(author!.id),
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          backgroundColor: Colors.amber[400],
          title: Text("Papers by ${author!.name}"),
        ),
        body: Column(
          children: [
            const SizedBox(height: 50.0),
            Center(
              child: Text(
                "Papers by ${author!.name}",
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
                      child: Text('No papers available for this author.'),
                    );
                  }
                  return PapersList(papers: papers);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
