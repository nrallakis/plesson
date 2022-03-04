import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plesson/data/models/assistant.dart';
import 'package:plesson/ui/components/avatar.dart';
import 'package:plesson/ui/components/info_card.dart';
import 'package:plesson/routes.dart' as routes;
import 'package:plesson/ui/components/label_swipe.dart';

class UserProfileScreen extends StatelessWidget {
  final Assistant assistant;

  const UserProfileScreen({required this.assistant, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _AssistantPreview(assistant: assistant),
            const SizedBox(height: 32),
            _PersonalInfo(assistant: assistant),
            const SizedBox(height: 32),
            _Subjects(subjects: assistant.subjects),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 8),
                  FloatingActionButton.extended(
                    onPressed: () => _showRatingDialog(context),
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit Profile'),
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

class _AssistantPreview extends StatelessWidget {
  const _AssistantPreview({Key? key, required this.assistant}) : super(key: key);

  final Assistant assistant;

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

class _Subjects extends StatelessWidget {
  const _Subjects({Key? key, required this.subjects}) : super(key: key);

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
          children: _subjectChips(context),
          spacing: 10,
          runSpacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
        ),
      ],
    );
  }

  List<Widget> _subjectChips(BuildContext context) {
    if (subjects.isEmpty) return const [Text('No subjects')];
    return subjects
        .map((subject) => Chip(
              label: Text(
                subject,
                style: GoogleFonts.robotoCondensed(color: Colors.white),
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ))
        .toList();
  }
}

class _PersonalInfo extends StatelessWidget {
  _PersonalInfo({Key? key, required this.assistant}) : super(key: key);

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
