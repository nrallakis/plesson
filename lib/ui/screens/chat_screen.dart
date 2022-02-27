import 'package:flutter/material.dart';
import 'package:plesson/ui/components/assistant_card.dart';
import 'package:plesson/viewmodels/saved_assistants_viewmodel.dart';
import 'package:provider/provider.dart';

class MessagesScreen extends StatelessWidget {
  const Messag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SavedAssistantsViewModel viewModel = context.watch<SavedAssistantsViewModel>();

    return Container(
      color: Colors.white,
    );
  }
}
