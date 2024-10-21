import 'package:conference_management_system/models/keyword.dart';
import 'package:conference_management_system/models/person.dart';
import 'package:conference_management_system/screens/authors/authors_list.dart';
import 'package:conference_management_system/screens/keywords/keywords_list.dart';
import 'package:conference_management_system/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KeywordsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: const Text("Home Screen"),
        backgroundColor: Colors.amber[400],
      ),
      body: FutureProvider<List<Keyword>?>(
        // Provider for authors
        create: (context) => DatabaseService(uid: 'uid').fetchAllKeywords(),
        initialData: null,
        child: const Column(
          children: [
            SizedBox(height: 50.0),
            Center(
              child: Text(
                'Keywords',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 40.0),
            Expanded(
              child: KeywordsList(),
            ),
          ],
        ),
      ),
    );
  }
}
