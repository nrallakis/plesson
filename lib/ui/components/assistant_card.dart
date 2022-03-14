import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'avatar.dart';

import '../../data/models/assistant.dart';

class AssistantCard extends StatelessWidget {
  final Assistant assistant;
  final VoidCallback? onBookmarkTapped;
  final VoidCallback? onMessageTapped;
  final VoidCallback? onMoreInfoTapped;
  final bool isBookmarked;

  const AssistantCard({
    Key? key,
    required this.assistant,
    required this.isBookmarked,
    this.onBookmarkTapped,
    this.onMessageTapped,
    this.onMoreInfoTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            ListTile(
              leading: Avatar(name: assistant.firstName, imagePath: assistant.imagePath),
              title: Text(
                assistant.fullName,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 2),
                  Text(
                    assistant.title,
                    style: TextStyle(color: Colors.black.withOpacity(0.8)),
                  ),
                  const SizedBox(height: 2),
                  RatingStars(
                    value: assistant.rating/2.toInt(),
                    valueLabelVisibility: false,
                    starSize: 12,
                    starColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                assistant.description,
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: onMessageTapped,
                    child: const Text('Message'),
                  ),
                  TextButton(
                    onPressed: onMoreInfoTapped,
                    child: const Text('More info'),
                  ),
                  const Spacer(),
                  IconButton(
                    alignment: Alignment.centerRight,
                    onPressed: onBookmarkTapped,
                    icon: Icon(
                      isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
