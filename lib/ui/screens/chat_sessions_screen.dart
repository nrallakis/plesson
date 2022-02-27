import 'package:flutter/material.dart';
import 'package:plesson/ui/components/assistant_card.dart';
import 'package:plesson/viewmodels/chat_viewmodel.dart';
import 'package:plesson/viewmodels/saved_assistants_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../routes.dart' as routes;

class ChatSessionsScreen extends StatelessWidget {
  const ChatSessionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatViewModel viewModel = context.watch<ChatViewModel>();

    final itemCount = viewModel.chatSessions.length;
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Messages')),
      body: itemCount > 0
          ? ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {

        },
      )
          : const Center(child: Text('No messages :)')),
    );
  }
}
