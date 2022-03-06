import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:plesson/data/models/assistant.dart';

import 'avatar.dart';

class AssistantPreview extends StatelessWidget {
  const AssistantPreview({
    Key? key,
    required this.assistant,
    this.onProfileImageTap,
  }) : super(key: key);

  final Assistant assistant;
  final VoidCallback? onProfileImageTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Avatar(
            name: assistant.firstName,
            size: 100,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                assistant.fullName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                assistant.title,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              RatingStars(
                value: assistant.rating / 2.toInt(),
                valueLabelVisibility: false,
                starSize: 12,
                starColor: Theme.of(context).primaryColor,
              ),
            ],
          ),
        )
      ],
    );
  }
}
