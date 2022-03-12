import 'package:flutter/material.dart';
import 'package:plesson/data/models/assistant.dart';
import 'package:plesson/routes.dart' as routes;
import 'package:plesson/ui/components/nav_bar.dart';
import 'package:plesson/ui/components/text_input_dialog.dart';

class EditProfileScreen extends StatelessWidget {
  final Assistant user;

  const EditProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(pageName: 'Edit Profile', showAvatar: false),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            _ListEditTile(
              title: 'Title',
              description: 'Change your displayed title',
              valueChanged: (String title) {
                user.title = title;
              },
            ),
            _ListEditTile(
              title: 'Description',
              description: 'Change your displayed description card',
              valueChanged: (String description) {
                user.description = description;
              },
            ),
            _ListEditTile(
              title: 'Contact',
              description: 'Change your displayed contact card',
              valueChanged: (String value) {},
            ),
            _ListEditTile(
              title: 'Education',
              description: 'Change your displayed education card',
              valueChanged: (String value) {},
            ),
            GestureDetector(
              child: Column(
                children: const [
                  Text(
                    'Subjects',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See and edit your subjects',
                    style: TextStyle(),
                  ),
                ],
              ),
              onTap: () => Navigator.pushNamed(context, routes.editSubject, arguments: user),
            )
          ],
        ),
      ),
    );
  }
}

class _ListEditTile extends StatelessWidget {
  final String title;
  final String description;
  final Function(String) valueChanged;

  const _ListEditTile({
    Key? key,
    required this.title,
    required this.description,
    required this.valueChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            description,
            style: const TextStyle(),
          ),
        ],
      ),
      onTap: () => _openInputDialog(context),
    );
  }

  void _openInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return TextInputDialog(
          text: 'Change $title',
          onResult: (String? value) {
            if (value != null) valueChanged(value);
          },
        );
      },
    );
  }
}
