import 'package:plesson/data/models/assistant.dart';

class AssistantRepository {
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
  List<Assistant> assistants = [];
  List<Assistant> get bookmarkedAssistants => currentUser.bookmarkedAssistants;

  List<Assistant> getAssistantsBySubject(String subject) {
    return assistants.where((assistant) => assistant.subjects.contains(subject)).toList();
  }

  void saveAssistant(Assistant assistant) {
    bookmarkedAssistants.add(assistant);
  }

  Assistant getAssistant(int id) => assistants.firstWhere((a) => a.id == id);
}

