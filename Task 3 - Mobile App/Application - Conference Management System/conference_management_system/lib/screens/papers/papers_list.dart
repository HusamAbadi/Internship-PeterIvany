import 'package:conference_management_system/models/paper.dart';
import 'package:conference_management_system/screens/papers/paper_tile.dart';
import 'package:flutter/material.dart';

class PapersList extends StatelessWidget {
  final List<Paper> papers;
  const PapersList({super.key, required this.papers});

  @override
  Widget build(BuildContext context) {
    papers.sort((a, b) => a.title.compareTo(b.title));
    return ListView.builder(
      itemCount: papers.length,
      itemBuilder: (context, index) {
        final paper = papers[index];
        return PaperTile(paper: paper);
      },
    );
  }
}
