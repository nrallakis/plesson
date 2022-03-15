import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../data/models/assistant.dart';
import '../../routes.dart' as routes;
import '../components/assistant_personal_info.dart';
import '../components/assistant_preview.dart';
import '../components/nav_bar.dart';
import '../components/subject_chips.dart';

class AssistantProfileScreen extends StatelessWidget {
  final Assistant assistant;

  const AssistantProfileScreen({required this.assistant, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(pageName: assistant.fullName),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AssistantPreview(assistant: assistant),
            const SizedBox(height: 32),
            PersonalInfo(assistant: assistant),
            const SizedBox(height: 32),
            Subjects(subjects: assistant.subjects),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton.extended(
                    onPressed: () => Navigator.pushNamed(context, routes.chat, arguments: assistant),
                    icon: const Icon(Icons.message),
                    label: const Text('Message'),
                    backgroundColor: Theme.of(context).primaryColorDark,
                  ),
                  const SizedBox(width: 8),
                  FloatingActionButton.extended(
                    onPressed: () => _showRatingDialog(context),
                    icon: const Icon(Icons.star),
                    label: const Text('Rate'),
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

  void _showRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Give your rating",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 22),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              child: RatingBar(
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemSize: 20,
                ratingWidget: RatingWidget(
                  full: const Icon(Icons.star, color: Colors.white),
                  half: const Icon(Icons.star_half, color: Colors.white),
                  empty: const Icon(Icons.star, color: Colors.white60),
                ),
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                onRatingUpdate: (rating) {},
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))
          ],
        );
      },
    );
  }
}
