import 'package:flutter/material.dart';
import 'package:plesson/data/models/assistant.dart';
import 'package:plesson/data/repositories/assistants_repository.dart';

class BookmarkedAssistantsViewModel extends ChangeNotifier {
  late AssistantRepository _repository;

  List<Assistant> get bookmarkedAssistants => _repository.bookmarkedAssistants;

  void save(Assistant assistant) {
    bookmarkedAssistants.add(assistant);
    notifyListeners();
  }

  void remove(Assistant assistant) {
    bookmarkedAssistants.remove(assistant);
    notifyListeners();
  }

  BookmarkedAssistantsViewModel(AssistantRepository repository) {
    _repository = repository;
  }
}