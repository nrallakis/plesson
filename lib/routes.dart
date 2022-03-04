import 'package:flutter/material.dart';
import 'package:plesson/data/models/assistant.dart';
import 'package:plesson/data/repositories/chat_repository.dart';
import 'package:plesson/ui/screens/assistant_profile_screen.dart';
import 'package:plesson/ui/screens/chat_screen.dart';
import 'package:plesson/ui/screens/home_screen.dart';
import 'package:plesson/ui/screens/login_screen.dart';

const String loginScreen = '/';
const String savedAssistants = '/saved';
const String assistant = '/assistant';
const String userprofile = '/userprofile';
const String home = '/home';
const String chat = '/chat';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case '/home':
      return MaterialPageRoute(builder: (_) => HomeScreen());
    case '/assistant':
      var assistant = settings.arguments as Assistant;
      return MaterialPageRoute(builder: (_) => AssistantProfileScreen(assistant: assistant));
    case '/assistant':
      var assistant = settings.arguments as Assistant;
      return MaterialPageRoute(builder: (_) => UserProfileScreen(assistant: assistant));
    case '/chat':
      var assistant = settings.arguments as Assistant;
      return MaterialPageRoute(builder: (_) => ChatScreen(assistant: assistant));
    default:
      return MaterialPageRoute(builder: (_) => LoginScreen());
  }
}