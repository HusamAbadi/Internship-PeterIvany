import 'package:conference_management_system/screens/home/conferences_screen.dart';
import 'package:conference_management_system/screens/home/authors_screen.dart';
import 'package:conference_management_system/screens/home/keywords_screen.dart';
import 'package:conference_management_system/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Wrapper(),
      home: Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          title: Text("Conference Management System"),
          titleTextStyle: TextStyle(fontSize: 16),
          backgroundColor: Colors.amber[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text("logout"),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the Column vertically
              children: [
                const Text(
                  "Conferences Management System",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Welcome Back!",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 30), // Space between text and buttons
                Column(
                  children: [
                    SizedBox(
                      width: 200, // Set uniform width for all buttons
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConferencesScreen()),
                          );
                        },
                        child: const Text("Conferences"),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AuthorsScreen()),
                          );
                        },
                        child: const Text("Authors"),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KeywordsScreen()),
                          );
                        },
                        child: const Text("Keywords"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
