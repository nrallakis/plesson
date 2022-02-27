import 'package:flutter/material.dart';
import 'package:plesson/data/models/assistant.dart';
import 'package:plesson/ui/screens/assistant_profile_screen.dart';
import 'package:plesson/ui/screens/open_app_screen.dart';
import 'package:plesson/ui/screens/saved_assistants_screen.dart';

const String loginScreen = '/';
const String savedAssistants = '/saved';
const String assistant = '/assistant';

class Router {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => OpenAppScreen());
      case '/saved':
        return MaterialPageRoute(builder: (_) => SavedAssistantsScreen());
      case '/assistant':
        var assistant = settings.arguments as Assistant;
        return MaterialPageRoute(builder: (_) => AssistantProfileScreen(assistant: assistant));
      default:
        return MaterialPageRoute(builder: (_) => OpenAppScreen());
    }
  }
}