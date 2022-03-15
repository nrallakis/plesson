import 'package:flutter/material.dart';
import '../data/models/assistant.dart';
import '../data/repositories/assistants_repository.dart';
import '../data/repositories/subjects_repository.dart';

class SearchAssistantsViewModel extends ChangeNotifier {
  late AssistantRepository _assistantsRepo;
  late SubjectsRepository _subjectsRepo;

  List<Assistant> get assistants => _assistantsRepo.assistants;

  late List<Assistant> _filteredAssistants;

  List<Assistant> get filteredAssistants => _filteredAssistants;

  late List<String> suggestions;

  SearchAssistantsViewModel(AssistantRepository assistantsRepo, SubjectsRepository subjectsRepo) {
    _assistantsRepo = assistantsRepo;
    _subjectsRepo = subjectsRepo;
    _filteredAssistants = _assistantsRepo.assistants;
    suggestions = [..._subjectsRepo.getAllSubjects(), ...subjectsRepo.keywords];
  }

  void onSearchChanged(String selection) {
    if (selection.toLowerCase() == "all") {
      _filteredAssistants = assistants;
      notifyListeners();
      return;
    }

    _filteredAssistants = assistants
        .where((assistant) => assistant.subjects.where((s) => s.startsWith(selection)).toList().isNotEmpty)
        .toList();
    notifyListeners();
  }

  bool userHasBookmarked(Assistant assistant) {
    return _assistantsRepo.user.bookmarkedAssistants.contains(assistant.id);
  }

  void onBookmarkTapped(Assistant assistant) {
    // Bookmark if not bookmarked or remove bookmark
    if (userHasBookmarked(assistant)) {
      _assistantsRepo.removeAssistant(assistant);
    } else {
      _assistantsRepo.bookmarkAssistant(assistant);
    }
    notifyListeners();
  }
}
