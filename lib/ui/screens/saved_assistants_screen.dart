import 'package:flutter/material.dart';
import 'package:plesson/ui/components/assistant_card.dart';
import 'package:plesson/viewmodels/saved_assistants_viewmodel.dart';
import 'package:provider/provider.dart';

class SavedAssistantsScreen extends StatelessWidget {
  const SavedAssistantsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SavedAssistantsViewModel viewModel = context.watch<SavedAssistantsViewModel>();

    final itemCount = viewModel.assistants.length;

    return Scaffold(
      appBar: AppBar(title: const Text('Bookmarked Assistants')),
      body: itemCount > 0
          ? ListView.builder(
              itemCount: itemCount,
              itemBuilder: (BuildContext context, int index) {
                return AssistantCard(
                  assistant: viewModel.assistants[index],
                  onMessageTapped: () {
                    /* Open message page with assistant */
                  },
                  onMoreInfoTapped: () {
                    /* Open assistant details page */
                  },
                  onBookmarkTapped: () {
                    viewModel.remove(viewModel.assistants[index]);
                  },
                );
              },
            )
          : const Center(child: Text('No bookmarked assistants :)')),
    );
  }
}
