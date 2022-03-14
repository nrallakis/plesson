import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../data/models/assistant.dart';

class Subjects extends StatelessWidget {
  final bool removable;

  const Subjects({
    Key? key,
    required this.subjects,
    this.removable = false,
  }) : super(key: key);

  final List<String> subjects;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Subjects',
          style: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold),
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

  List<Widget> subjectChips(BuildContext context, List<String> subjects) {
    if (subjects.isEmpty) return const [Text('No subjects')];
    return subjects
        .map((subject) => removable ? RemovableChip(subject: subject) : NormalChip(subject: subject))
        .toList();
  }
}

class NormalChip extends StatelessWidget {
  const NormalChip({Key? key, required this.subject}) : super(key: key);

  final String subject;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        subject,
        style: GoogleFonts.robotoCondensed(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}

class RemovableChip extends StatelessWidget {
  const RemovableChip({Key? key, required this.subject}) : super(key: key);

  final String subject;

  @override
  Widget build(BuildContext context) {
    Assistant user = context.watch<Assistant>();

    return Chip(
        label: Text(
          subject,
          style: GoogleFonts.robotoCondensed(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        deleteIcon: const Icon(Icons.cancel),
        deleteIconColor: Colors.white60,
        onDeleted: () {
          user.removeSubject(subject);
        });
  }
}
