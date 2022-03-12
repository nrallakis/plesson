import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:plesson/core/extensions/chat.dart';
import 'package:plesson/core/utils.dart';
import 'package:plesson/data/models/assistant.dart';
import 'package:plesson/data/repositories/assistants_repository.dart';
import 'package:plesson/data/repositories/chat_repository.dart';

class ChatViewModel extends ChangeNotifier {
  //Used on chatSessionsScreen
  List<ChatSession> _chatSessions = [];

  List<ChatSession> get chatSessions {
    return _chatSessions;
  }

  //Used on messagesScreen
  ChatSession? currentSession;

  late User user;
  late AssistantRepository _assistantRepo;
  late ChatRepository _chatRepo;

  ChatViewModel(AssistantRepository assistantRepo, ChatRepository chatRepo) {
    _assistantRepo = assistantRepo;
    _chatRepo = chatRepo;
    _chatSessions = chatRepo.chatSessions;
    user = _assistantRepo.user.toChatUser();
  }

  void setChatWith(Assistant assistant) {
    currentSession = _chatSessions.firstWhere(
      (session) => session.from == assistant,
      orElse: () {
        ChatSession newSession = ChatSession(from: assistant, messages: []);
        _chatSessions.add(newSession);
        return newSession;
      },
    );
  }

  void addMessage(TextMessage message) {
    currentSession?.messages.insert(0, message);
    _chatSessions.sort(
      (s1, s2) => s2.messages.first.createdAt!.compareTo(s1.messages.first.createdAt!),
    );
    notifyListeners();
  }

  void onSendPressed(PartialText message) {
    final textMessage = TextMessage(
      author: user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomId(),
      text: message.text,
    );

    addMessage(textMessage);
  }
}
