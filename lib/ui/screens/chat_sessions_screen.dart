import 'package:flutter/material.dart';
import 'package:plesson/data/repositories/chat_repository.dart';
import 'package:plesson/ui/components/avatar.dart';
import 'package:plesson/ui/components/nav_bar.dart';
import 'package:plesson/viewmodels/chat_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:plesson/routes.dart' as routes;

class ChatSessionsScreen extends StatelessWidget {
  const ChatSessionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatViewModel viewModel = context.watch<ChatViewModel>();
    final itemCount = viewModel.chatSessions.length;
    return Scaffold(
      appBar: const NavBar(pageName: 'Personal Messages'),
      body: itemCount > 0
          ? ListView.builder(
              itemCount: itemCount,
              itemBuilder: (BuildContext context, int index) {
                return ChatListTile(session: viewModel.chatSessions[index]);
              },
            )
          : const Center(child: Text('No messages :)')),
    );
  }
}

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    Key? key,
    required this.session,
  }) : super(key: key);

  final ChatSession session;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Avatar(
        name: session.from.fullName,
      ),
      title: Text(session.from.fullName),
      subtitle: Text(session.lastMessage),
      trailing: Text(session.lastTimestamp),
      onTap: () => Navigator.pushNamed(context, routes.chat, arguments: session.from),
    );
  }
}
