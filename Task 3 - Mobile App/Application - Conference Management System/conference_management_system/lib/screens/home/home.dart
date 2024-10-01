import 'package:conference_management_system/screens/home/conferences_screen.dart';
import 'package:conference_management_system/screens/home/authors_screen.dart';
import 'package:conference_management_system/screens/home/keywords_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Wrapper(),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 233, 233),
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
