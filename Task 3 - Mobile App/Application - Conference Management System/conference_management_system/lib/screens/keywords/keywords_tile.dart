import 'package:conference_management_system/models/keyword.dart';
import 'package:conference_management_system/models/person.dart';
import 'package:conference_management_system/screens/papers/papers_screen.dart';
import 'package:flutter/material.dart';

class KeywordsTile extends StatelessWidget {
  final Keyword keyword;
  const KeywordsTile({super.key, required this.keyword});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          keyword.name,
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PapersScreen.keyword(
                keyword: keyword,
              ),
            ),
          );
        },
      ),
    );
  }
}
