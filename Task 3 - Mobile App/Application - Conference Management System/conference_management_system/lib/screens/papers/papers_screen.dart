import 'package:conference_management_system/models/conference.dart';
import 'package:conference_management_system/models/keyword.dart';
import 'package:conference_management_system/models/paper.dart';
import 'package:conference_management_system/models/person.dart';
import 'package:conference_management_system/models/session.dart';
import 'package:conference_management_system/screens/papers/papers_list.dart';
import 'package:conference_management_system/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PapersScreen extends StatelessWidget {
  final Session? session;
  final Conference? conference;
  final Person? author;
  final Keyword? keyword;

  // Constructor for SessionTile navigation
  const PapersScreen.session({
    super.key,
    required this.session,
    required this.conference,
  })  : author = null,
        keyword = null;

  // Constructor for AuthorsTile navigation
  const PapersScreen.author({
    super.key,
    required this.author,
  })  : session = null,
        conference = null,
        keyword = null;

  // Constructor for KeywordsTile navigation
  const PapersScreen.keyword({
    super.key,
    required this.keyword,
  })  : session = null,
        conference = null,
        author = null;

  @override
  Widget build(BuildContext context) {
    // Select which screen to build based on available parameters
    if (author != null) {
      return _buildAuthorPapersScreen();
    } else if (keyword != null) {
      return _buildKeywordPapersScreen();
    } else {
      return _buildSessionPapersScreen();
    }
  }

  Widget _buildSessionPapersScreen() {
    return _buildPapersScreen(
      title: "Papers for ${session!.title}",
      fetchPapers: () =>
          DatabaseService(uid: 'uid').fetchPapers(session!.papers),
      appBarTitle: conference!.name,
    );
  }

  Widget _buildAuthorPapersScreen() {
    return _buildPapersScreen(
      title: "Papers by ${author!.name}",
      fetchPapers: () =>
          DatabaseService(uid: 'uid').fetchPapersByAuthor(author!.id),
      appBarTitle: "Papers by ${author!.name}",
    );
  }

  Widget _buildKeywordPapersScreen() {
    return _buildPapersScreen(
      title: "Papers by ${keyword!.name} keyword",
      fetchPapers: () =>
          DatabaseService(uid: 'uid').fetchPapersByKeyword(keyword!.id),
      appBarTitle: 'Papers by ${keyword!.name}',
    );
  }

  Widget _buildPapersScreen({
    required String title,
    required Future<List<Paper>?> Function() fetchPapers,
    required String appBarTitle,
  }) {
    return FutureProvider<List<Paper>?>(
      create: (context) => fetchPapers(),
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          backgroundColor: Colors.amber[400],
          title: Text(appBarTitle),
        ),
        body: Column(
          children: [
            const SizedBox(height: 50.0),
            Center(
              child: Text(
                title,
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
                    return const Center(child: Text('No papers available.'));
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
