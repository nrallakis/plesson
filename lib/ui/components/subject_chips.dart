import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../data/models/assistant.dart';

class Subjects extends StatelessWidget {
  final bool removeButton;

  const Subjects({Key? key, required this.subjects,
    this.removeButton = false,
  })
      : super(key: key);

  final List<String> subjects;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Subjects',
          style: TextStyle(
              color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Wrap(
          children: subjectChips(context, subjects),
          spacing: 10,
          runSpacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
        ),
      ],
    );
  }

  List<Widget> subjectChips(
      BuildContext context, List<String> subjects) {
    if (subjects.isEmpty) return const [Text('No subjects')];
    return subjects
        .map((subject) => Chip(
              label: Text(
                subject,
                style: GoogleFonts.robotoCondensed(color: Colors.white),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              // isBookmarked ? Icons.bookmark : Icons.bookmark_border
              deleteIcon: (removeButton) ? Icon(Icons.cancel) : null,
              deleteIconColor: (removeButton) ? Colors.white60 : null,
              onDeleted: (removeButton) ? () {
                Assistant user = context.read<Assistant>();
                user.removeSubject(subject);
              } : null,
            ))
        .toList();
  }
}
