import 'package:flutter/material.dart';
import 'package:plesson/ui/components/assistant_card.dart';
import 'package:plesson/viewmodels/bookmarked_assistants_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../routes.dart' as routes;
import '../components/nav_bar.dart';

class BookmarkedAssistantsScreen extends StatelessWidget {
  const BookmarkedAssistantsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookmarkedAssistantsViewModel viewModel = context.watch<BookmarkedAssistantsViewModel>();

    final itemCount = viewModel.bookmarkedAssistants.length;

    if (itemCount == 0) {
      return const Center(child: Text('No bookmarked assistants :)'));
    }

    return Scaffold(
      appBar: NavBar(pageName: 'Bookmarked Assisstants'),
      body: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          final assistant = viewModel.bookmarkedAssistants[index];
          return AssistantCard(
            assistant: assistant,
            isBookmarked: true,
            onMessageTapped: () {
              /* Open message page with assistant */
              Navigator.pushNamed(context, routes.chat, arguments: assistant);
            },
            onMoreInfoTapped: () {
              /* Open assistant details page */
              Navigator.pushNamed(context, routes.assistant, arguments: assistant);
            },
            onBookmarkTapped: () {
              viewModel.remove(assistant);
            },
          );
        },
      ),
    );
  }
}
