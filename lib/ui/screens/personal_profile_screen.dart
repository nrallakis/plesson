import 'package:flutter/material.dart';
import 'package:plesson/data/models/assistant.dart';
import 'package:plesson/ui/components/assistant_personal_info.dart';
import 'package:plesson/ui/components/assistant_preview.dart';
import 'package:plesson/ui/components/subject_chips.dart';
import 'package:plesson/routes.dart' as routes;
import 'package:provider/provider.dart';

import '../components/nav_bar.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Assistant user = context.watch<Assistant>();

    return Scaffold(
      appBar: NavBar(pageName: 'Personal Profile', showAvatar: false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AssistantPreview(assistant: user),
            const SizedBox(height: 32),
            PersonalInfo(assistant: user),
            const SizedBox(height: 32),
            Subjects(subjects: user.subjects),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 8),
                  FloatingActionButton.extended(
                    onPressed: () => { Navigator.pushNamed(context, routes.userProfileEdit, arguments: user)},
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'),
                    backgroundColor: Theme.of(context).primaryColorDark,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
