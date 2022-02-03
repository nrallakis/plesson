import 'package:flutter/material.dart';
import 'package:plesson/data/models/assistant.dart';
import 'package:plesson/data/repositories/assistants_repository.dart';

class SavedAssistantsViewModel with ChangeNotifier {
  late AssistantRepository _repository;

  late List<Assistant> _assistants;

  List<Assistant> get assistants => _assistants;

  void save(Assistant assistant) {
    assistants.add(assistant);
    notifyListeners();
  }

  void remove(Assistant assistant) {
    assistants.remove(assistant);
    notifyListeners();
  }

  SavedAssistantsViewModel(AssistantRepository repository) {
    _repository = repository;
    _assistants = repository.getSavedAssistants();
  }
}