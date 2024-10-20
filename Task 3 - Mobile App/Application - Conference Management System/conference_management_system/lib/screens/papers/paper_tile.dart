import 'package:conference_management_system/models/conference.dart';
import 'package:conference_management_system/models/paper.dart';
import 'package:conference_management_system/models/session.dart';
import 'package:conference_management_system/screens/papers/paper_details.dart';
import 'package:conference_management_system/screens/papers/papers_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaperTile extends StatelessWidget {
  // final Conference conference;
  // final Session session;
  final Paper paper;

  const PaperTile({
    super.key,
    required this.paper,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
      child: ListTile(
        title: Text(paper.title),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaperDetails(paper: paper),
            ),
          );
        },
      ),
    );
  }
}
