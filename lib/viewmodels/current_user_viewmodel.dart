import 'package:flutter/material.dart';
import 'package:plesson/data/models/assistant.dart';
import 'package:plesson/data/repositories/assistants_repository.dart';

class CurrentUserViewModel extends ChangeNotifier {

  late Assistant user;

  CurrentUserViewModel(AssistantRepository repo) {
    user = repo.currentUser;
  }
}