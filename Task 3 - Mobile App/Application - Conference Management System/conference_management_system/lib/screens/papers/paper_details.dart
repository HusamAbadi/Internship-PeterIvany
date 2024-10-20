import 'package:conference_management_system/models/paper.dart';
import 'package:conference_management_system/models/person.dart';
import 'package:conference_management_system/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaperDetails extends StatelessWidget {
  final Paper paper;
  const PaperDetails({super.key, required this.paper});

  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<Person>?>(
      create: (context) =>
          DatabaseService(uid: 'uid').fetchAuthors(paper.authors),
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          backgroundColor: Colors.amber[300],
          title: Text("Paper Details"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(
              20.0), // Adding padding to the entire content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      paper.title,
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              Center(
                child:
                    Consumer<List<Person>?>(builder: (context, authors, child) {
                  if (authors == null) {
                    // Display loading indicator when data is not yet loaded
                    return Center(child: CircularProgressIndicator());
                  } else if (authors.isEmpty) {
                    // Handle the case where no authors are found
                    return Center(child: Text('No authors found.'));
                  } else {
                    return Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal, // Horizontal scroll
                          child: Row(
                            children: authors.map((author) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  '-${author.name}',
                                  style:
                                      const TextStyle(color: Colors.lightBlue),
                                ),
                              );
                            }).toList(),
                          ),
                        ));
                  }
                }),
              ),
              // Constrained box for the abstract card to limit height and make it scrollable
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 600.0, // Limit the height of the abstract card
                ),
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Text(paper.abstract),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
