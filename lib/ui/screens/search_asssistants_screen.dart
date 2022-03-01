import 'package:flutter/material.dart';
import 'package:plesson/ui/components/assistant_card.dart';
import 'package:plesson/viewmodels/search_assistants_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';

import '../../routes.dart' as routes;

class SearchAssistantsScreen extends StatelessWidget {
  const SearchAssistantsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchAssistantsViewModel viewModel = context.watch<SearchAssistantsViewModel>();

    int itemCount = viewModel.filteredAssistants.length;

    if (itemCount == 0) {
      return const Center(child: Text('No assistants found :/'));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Search Assistants')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchField(
              controller: viewModel.searchController,
              suggestions: viewModel.suggestions.map((s) => SearchFieldListItem(s)).toList(),
              hint: 'Search for subjects or universities',
              searchInputDecoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: itemCount,
              itemBuilder: (BuildContext context, int index) {
                return AssistantCard(
                  assistant: viewModel.filteredAssistants[index],
                  isBookmarked: viewModel.userHasBookmarked(viewModel.filteredAssistants[index]),
                  onMessageTapped: () {
                    /* Open message page with assistant */
                    Navigator.pushNamed(context, routes.chat, arguments: viewModel.filteredAssistants[index]);
                  },
                  onMoreInfoTapped: () {
                    /* Open assistant details page */
                    Navigator.pushNamed(context, routes.assistant, arguments: viewModel.filteredAssistants[index]);
                  },
                  onBookmarkTapped: () {
                    viewModel.onBookmarkTapped(viewModel.filteredAssistants[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
