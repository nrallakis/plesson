import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:plesson/data/models/assistant.dart';
import 'package:plesson/data/repositories/chat_repository.dart';
import 'package:plesson/viewmodels/chat_viewmodel.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key, required this.assistant}) : super(key: key);

  final Assistant assistant;

  @override
  Widget build(BuildContext context) {
    ChatViewModel viewModel = context.watch<ChatViewModel>();
    viewModel.setChatWith(assistant);
    ChatSession session = viewModel.currentSession!;

    return Scaffold(
      appBar: AppBar(title: Text(session.from.fullName)),
      body: SafeArea(
        bottom: false,
        child: Chat(
          messages: session.messages,
          user: viewModel.user,
          onSendPressed: viewModel.onSendPressed,
          theme: DefaultChatTheme(
            primaryColor: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
