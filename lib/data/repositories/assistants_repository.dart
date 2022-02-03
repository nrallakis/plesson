import 'package:plesson/data/models/assistant.dart';

class AssistantRepository {
  final user = Assistant(
    id: 0,
    username: 'user',
    firstName: 'Nicholas',
    lastName: 'Rallakis',
    bookmarkedAssistants: [],
    rating: 8,
    description: 'Bsc in Maths. Can also assist in Physics and Chemistry. I also teach Algorithms, Data Structures & Programming languages.',
    title: 'Maths',
    subjects: [],
  );

  Assistant getUser() => user;

  final _assistants = [
    Assistant(
      id: 0,
      username: 'alex',
      firstName: 'Alex',
      lastName: 'Tsafos',
      bookmarkedAssistants: [],
      rating: 9,
      description: 'I teach Algorithms, Data Structures & Programming languages. Experienced in Python, Dart and C++.',
      title: 'Software Engineer',
      subjects: ['Programming'],
    ),
    Assistant(
      id: 1,
      username: 'andreas',
      firstName: 'Andreas',
      lastName: 'Vatistas',
      bookmarkedAssistants: [],
      rating: 7,
      description: 'Doing private teaching lessons on advanced physics for physics students for the past 8 years',
      title: 'Physicist',
      subjects: ['Physics', 'Maths'],
    ),
    Assistant(
      id: 2,
      username: 'bill',
      firstName: 'Bill',
      lastName: 'Vrettos',
      bookmarkedAssistants: [],
      rating: 9,
      description: 'Specialized in electronics, microprocessors and everything considered low-level programming. BSc in ECE',
      title: 'Compilers Engineer',
      subjects: ['Compilers', 'VLSI', 'Microprocessors'],
    ),
    Assistant(
      id: 3,
      username: 'avg',
      firstName: 'Avgoustinos',
      lastName: 'Dritsas',
      bookmarkedAssistants: [],
      rating: 10,
      description: 'Passionate in quantum mechanics and nano robots',
      title: '1000 IQ',
      subjects: ['Robotics', 'Quantum Physics'],
    ),
    Assistant(
      id: 4,
      username: 'tassos',
      firstName: 'Tassos',
      lastName: 'Stergiopoulos',
      bookmarkedAssistants: [],
      rating: 8,
      description: 'Neural networks PhD, interested in computational economics',
      title: 'AI Economist',
      subjects: ['AI', 'Economics'],
    ),
  ];

  List<Assistant> getAssistantsBySubject(String subject) {
    return _assistants.where((assistant) => assistant.subjects.contains(subject)).toList();
  }

  List<Assistant> getSavedAssistants() {
    // In real app get from cache or from an api
    return [
      _assistants[0],
      _assistants[1],
      _assistants[2],
      _assistants[1],
      _assistants[2],
      _assistants[1],
      _assistants[2],
    ];
  }
}
