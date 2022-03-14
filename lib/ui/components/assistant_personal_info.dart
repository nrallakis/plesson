import 'package:flutter/material.dart';
import '../../data/models/assistant.dart';

import 'info_card.dart';
import 'label_swipe.dart';

class PersonalInfo extends StatelessWidget {
  PersonalInfo({Key? key, required this.assistant}) : super(key: key);

  final Assistant assistant;
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SwipeLabel(text: 'Personal Info'),
        const SizedBox(height: 16),
        SizedBox(
          height: 150,
          child: PageView(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            children: [
              InfoCard(title: 'Description', text: assistant.description),
              InfoCard(title: 'Contact', text: assistant.contactDetails),
              InfoCard(title: 'Education', text: assistant.educationDetails),
            ],
          ),
        ),
      ],
    );
  }
}