import 'package:conference_management_system/models/keyword.dart';
import 'package:conference_management_system/models/person.dart';
import 'package:conference_management_system/screens/authors/authors_tile.dart';
import 'package:conference_management_system/screens/keywords/keywords_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KeywordsList extends StatelessWidget {
  const KeywordsList({super.key});

  @override
  Widget build(BuildContext context) {
    final keywords = Provider.of<List<Keyword>?>(context);

    if (keywords == null || keywords.isEmpty) {
      return const Center(
        child: Text("No keywords found"),
      );
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Number of tiles per row
        crossAxisSpacing: 0.0, // Space between columns
        mainAxisSpacing: 5.0, // Space between rows
        childAspectRatio: 1.4, // Increase the width of each tile
      ),
      itemCount: keywords.length,
      itemBuilder: (context, index) {
        return KeywordsTile(
          keyword: keywords[index],
        );
      },
    );
  }
}
