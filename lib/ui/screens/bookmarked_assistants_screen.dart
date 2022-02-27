import 'package:flutter/material.dart';
import 'package:plesson/ui/components/assistant_card.dart';
import 'package:plesson/viewmodels/bookmarked_assistants_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../routes.dart' as routes;

class BookmarkedAssistantsScreen extends StatelessWidget {
  const BookmarkedAssistantsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookmarkedAssistantsViewModel viewModel = context.watch<BookmarkedAssistantsViewModel>();

    final itemCount = viewModel.assistants.length;
    return Scaffold(
      appBar: AppBar(title: const Text('Bookmarked Assistants')),
      body: itemCount > 0
          ? ListView.builder(
              itemCount: itemCount,
              itemBuilder: (BuildContext context, int index) {
                final assistant = viewModel.assistants[index];
                return AssistantCard(
                  assistant: assistant,
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
            )
          : const Center(child: Text('No bookmarked assistants :)')),
    );
  }
}
