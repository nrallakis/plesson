import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:plesson/core/extensions/helpers.dart';
import 'package:plesson/data/models/assistant.dart';

class ChatRepository {
  late List<ChatSession> chatSessions;
  
  ChatSession getChatSessionWith(Assistant assistant) {
    return chatSessions.firstWhere((cs) => cs.from == assistant,
        orElse: () => ChatSession(from: assistant, messages: []));
  }
}

class ChatSession {
  final Assistant from;
  List<TextMessage> messages;

  String get lastMessage => messages.isEmpty ? "" : messages.first.text;
  String get lastTimestamp => messages.isEmpty ? "" : messages.first.createdAt!.toHourMinutesFormat();

  ChatSession({required this.from, required this.messages});
}
