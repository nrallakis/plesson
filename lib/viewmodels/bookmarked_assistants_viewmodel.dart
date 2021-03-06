import 'package:flutter/material.dart';
import '../data/models/assistant.dart';
import '../data/repositories/assistants_repository.dart';

class BookmarkedAssistantsViewModel extends ChangeNotifier {
  late AssistantRepository _repository;
  List<Assistant> get bookmarkedAssistants => _repository.bookmarkedAssistants;

  void bookmark(Assistant assistant) {
    _repository.bookmarkAssistant(assistant);
    notifyListeners();
  }

  void remove(Assistant assistant) {
    _repository.removeAssistant(assistant);
    notifyListeners();
  }

  BookmarkedAssistantsViewModel(AssistantRepository repository) {
    _repository = repository;
  }
}