import 'package:conference_management_system/models/person.dart';
import 'package:conference_management_system/screens/authors/authors_list.dart';
import 'package:conference_management_system/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthorsScreen extends StatelessWidget {
  const AuthorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: const Text('Authors List'), // More descriptive title
        backgroundColor: Colors.amber[400],
      ),
      body: FutureProvider<List<Person>?>(
        create: (context) => DatabaseService(uid: 'uid').fetchAllAuthors(),
        initialData: null,
        child: const Column(
          children: [
            SizedBox(height: 50.0),
            Center(
              child: Text(
                'Authors',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 40.0),
            Expanded(
              child: AuthorsList(),
            ),
          ],
        ),
      ),
    );
  }
}
