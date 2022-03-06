import 'package:flutter/material.dart';
import 'package:plesson/data/models/assistant.dart';
import 'package:plesson/data/repositories/assistants_repository.dart';
import 'package:plesson/data/repositories/assistants_repository.dart';
import 'package:plesson/data/repositories/subjects_repository.dart';

class SearchAssistantsViewModel extends ChangeNotifier {
  late AssistantRepository _assistantsRepo;
  late SubjectsRepository _subjectsRepo;

  List<Assistant> get assistants => _assistantsRepo.assistants;

  late List<Assistant> _filteredAssistants;

  List<Assistant> get filteredAssistants => _filteredAssistants;

  late List<String> suggestions;
  late TextEditingController _searchController;

  SearchAssistantsViewModel(AssistantRepository assistantsRepo, SubjectsRepository subjectsRepo) {
    _assistantsRepo = assistantsRepo;
    _subjectsRepo = subjectsRepo;
    _filteredAssistants = _assistantsRepo.assistants;
    suggestions = [..._subjectsRepo.getAllSubjects(), ...subjectsRepo.keywords];

    _searchController = TextEditingController();
    _searchController.addListener(onSearchChanged);
  }

  get searchController => _searchController;

  void onSearchChanged() {
    final String query = _searchController.text.toUpperCase();
    _filteredAssistants = assistants
        .where((assistant) => assistant.subjects.where((s) => s.startsWith(query)).toList().isNotEmpty)
        .toList();
    notifyListeners();
  }

  bool userHasBookmarked(Assistant assistant) {
    return currentUser.bookmarkedAssistants.contains(assistant);
  }

  void onBookmarkTapped(Assistant assistant) {
    // Bookmark if not bookmarked or remove bookmark
    if (currentUser.bookmarkedAssistants.contains(assistant)) {
      _assistantsRepo.bookmarkedAssistants.remove(assistant);
    } else {
      _assistantsRepo.bookmarkedAssistants.add(assistant);
    }
    notifyListeners();
  }
}
