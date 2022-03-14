import 'package:flutter_chat_types/flutter_chat_types.dart';
import '../../data/models/assistant.dart';

extension UserX on Assistant {
  /// Used for the chat ui control
  User toChatUser() => User(
        id: id.toString(),
        firstName: firstName,
        lastName: lastName,
      );
}
