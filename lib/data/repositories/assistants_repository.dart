import 'dart:convert';

import 'package:plesson/data/models/assistant.dart';
import 'package:shared_preferences/shared_preferences.dart';

final currentUser = Assistant(
  id: 0,
  username: 'user',
  firstName: 'Nicholas',
  lastName: 'Rallakis',
  bookmarkedAssistants: [],
  rating: 8,
  description: 'Bsc in Maths. Can also assist in Physics and Chemistry. I also teach Algorithms, Data Structures & Programming languages.',
  title: 'Maths',
  subjects: [],
  email: 'nrallakis4@gmail.com',
  linkedIn: 'Nicholas Rallakis',
  facebook: 'Nicholas Rallakis',
);

const currentUserKey = "current_user_json";

class AssistantRepository {

  List<Assistant> assistants = [];
  List<Assistant> get bookmarkedAssistants {
    return currentUser.bookmarkedAssistants
        .map((int id) => getAssistant(id)).toList();
  }

  List<Assistant> getAssistantsBySubject(String subject) {
    return assistants.where((assistant) => assistant.subjects.contains(subject)).toList();
  }

  void saveAssistant(Assistant assistant) {
    bookmarkedAssistants.add(assistant);
  }

  Future<Assistant> loadAssistantFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = await prefs.getString(currentUserKey);
    if (userJson == null) throw Exception('Problem with loading user');
    Assistant user = Assistant.fromJson(jsonDecode(userJson!));
    return currentUser;
  }

  Future<void> saveUserToLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(currentUserKey, jsonEncode(currentUser.toJson()));
  }

  Assistant getAssistant(int id) => assistants.firstWhere((a) => a.id == id);
}

