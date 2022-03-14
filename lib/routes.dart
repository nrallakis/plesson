import 'package:flutter/material.dart';
import 'package:plesson/data/models/assistant.dart';
import 'package:plesson/ui/screens/assistant_profile_screen.dart';
import 'package:plesson/ui/screens/chat_screen.dart';
import 'package:plesson/ui/screens/edit_user_profile_screen.dart';
import 'package:plesson/ui/screens/home_screen.dart';
import 'package:plesson/ui/screens/login_screen.dart';
import 'package:plesson/ui/screens/opening_screen.dart';
import 'package:plesson/ui/screens/personal_profile_screen.dart';
import 'package:plesson/ui/screens/register_screen.dart';

const String openingScreen = '/';
const String loginScreen = '/login';
const String registerScreen = '/register';
const String savedAssistants = '/saved';
const String assistant = '/assistant';
const String userProfile = '/userprofile';
const String userProfileEdit = '/userprofile/edit';
const String home = '/home';
const String chat = '/chat';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const OpeningScreen());
    case '/login':
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case '/register':
      return MaterialPageRoute(builder: (_) => const RegisterScreen());
    case '/home':
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case '/assistant':
      var assistant = settings.arguments as Assistant;
      return MaterialPageRoute(builder: (_) => AssistantProfileScreen(assistant: assistant));
    case '/userprofile':
      return MaterialPageRoute(builder: (_) => const UserProfileScreen());
    case '/userprofile/edit':
      return MaterialPageRoute(builder: (_) => const EditProfileScreen());
    case '/chat':
      var assistant = settings.arguments as Assistant;
      return MaterialPageRoute(builder: (_) => ChatScreen(assistant: assistant));
    default:
      return MaterialPageRoute(builder: (_) => const OpeningScreen());
  }
}