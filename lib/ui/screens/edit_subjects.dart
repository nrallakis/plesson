import 'package:flutter/material.dart';
import 'package:plesson/ui/components/assistant_card.dart';
import 'package:plesson/viewmodels/bookmarked_assistants_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../data/models/assistant.dart';
import '../../routes.dart' as routes;
import '../components/nav_bar.dart';
import '../components/subject_chips.dart';

class EditProfileSubjects extends StatelessWidget {
  final Assistant user;

  const EditProfileSubjects({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(pageName: 'Personal Profile', showAvatar: false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Subjects(
              subjects: user.subjects,
              removeButton: true,
            ),
          ],
        ),
      ),
    );
  }
}
