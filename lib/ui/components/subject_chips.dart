import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Subjects extends StatelessWidget {
  final bool removeButton;
  final VoidCallback? onDeletedTapped;

  const Subjects({Key? key, required this.subjects, this.removeButton = false, this.onDeletedTapped})
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
              onDeleted: (removeButton) ? onDeletedTapped : null,
            ))
        .toList();
  }
}
