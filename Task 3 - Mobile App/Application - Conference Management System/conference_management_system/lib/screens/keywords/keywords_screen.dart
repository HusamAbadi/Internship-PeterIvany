import 'package:conference_management_system/models/keyword.dart';
import 'package:conference_management_system/screens/keywords/keywords_list.dart';
import 'package:conference_management_system/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KeywordsScreen extends StatelessWidget {
  const KeywordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: const Text("Keywords Screen"),
        backgroundColor: Colors.amber[400],
      ),
      body: FutureProvider<List<Keyword>?>(
        // Provider for keywords
        create: (context) async {
          try {
            return await DatabaseService(uid: 'uid').fetchAllKeywords();
          } catch (e) {
            // Handle any error that may occur during fetching
            return []; // Return an empty list if there's an error
          }
        },
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
