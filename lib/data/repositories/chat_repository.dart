import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:plesson/data/models/assistant.dart';

class ChatRepository {
  late List<ChatSession> chatSessions;

  ChatRepository() {
  }
  
  ChatSession getChatSessionWith(Assistant assistant) {
    return chatSessions.firstWhere((cs) => cs.from == assistant,
        orElse: () => ChatSession(from: assistant, lastMessage: ""));
  }
}

class ChatSession {
  final Assistant from;
  final String lastMessage;
  List<Message> messages;

  ChatSession({required this.from, required this.lastMessage, this.messages});
}
