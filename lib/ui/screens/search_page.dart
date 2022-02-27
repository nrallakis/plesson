import 'package:flutter/material.dart';
import 'package:plesson/ui/components/assistant_card.dart';
import 'package:plesson/viewmodels/bookmarked_assistants_viewmodel.dart';
import 'package:provider/provider.dart';

class SearchAssistantsScreen extends StatelessWidget {
  const SearchAssistantsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookmarkedAssistantsViewModel viewModel = context.watch<BookmarkedAssistantsViewModel>();

    return Container(
      color: Colors.white,
    );
  }
}
