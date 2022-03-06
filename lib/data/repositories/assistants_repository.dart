import 'dart:convert';

import 'package:plesson/core/extensions/seed.dart';
import 'package:plesson/data/models/assistant.dart';
import 'package:shared_preferences/shared_preferences.dart';

const currentUserKey = "current_user_json";

class AssistantRepository {

  List<Assistant> assistants = [];
  List<Assistant> get bookmarkedAssistants {
    return user.bookmarkedAssistants
        .map((int id) => getAssistant(id)).toList();
  }

  List<Assistant> getAssistantsBySubject(String subject) {
    return assistants.where((assistant) => assistant.subjects.contains(subject)).toList();
  }

  Assistant? _user;

  void saveAssistant(Assistant assistant) {
    bookmarkedAssistants.add(assistant);
  }

  Assistant get user => _user!;

  Future loadUserFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(currentUserKey);

    if (userJson == null) {
      _user = seedUser;
      saveUserToLocalStorage();
    } else {
      _user = Assistant.fromJson(jsonDecode(userJson));
    }
  }

  Future<void> saveUserToLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(currentUserKey, jsonEncode(user.toJson()));
  }

  Assistant getAssistant(int id) => assistants.firstWhere((a) => a.id == id);
}

