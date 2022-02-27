import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:plesson/core/extensions/chatX.dart';
import 'package:plesson/data/models/assistant.dart';
import 'package:plesson/data/repositories/assistants_repository.dart';
import 'package:plesson/data/repositories/chat_repository.dart';

extension AssistantRepoX on AssistantRepository {
  void seed() {
    assistants = _assistants;
    savedAssistants = _savedAssistants;
  }
}

extension ChatRepoX on ChatRepository {
  void seed() {
    chatSessions = _chatSessions;
  }
}

final _savedAssistants =  [
  _assistants[0],
  _assistants[1],
  _assistants[2],
  _assistants[1],
  _assistants[2],
  _assistants[1],
  _assistants[2],
];

final _assistants = [
  Assistant(
    id: 0,
    username: 'alex',
    firstName: 'Alex',
    lastName: 'Tsafos',
    bookmarkedAssistants: [],
    rating: 9,
    description:
        'I teach Algorithms, Data Structures & Programming languages. Experienced in Python, Dart and C++.',
    title: 'Software Engineer',
    subjects: ['Programming', 'Compilers', 'VLSI', 'Microprocessors', 'AI', 'Economics'],
    email: 'alextsafos@gmail.com',
    linkedIn: 'Alex Tsafos',
    facebook: 'Alex Tsafos',
  ),
  Assistant(
    id: 1,
    username: 'andreas',
    firstName: 'Andreas',
    lastName: 'Vatistas',
    bookmarkedAssistants: [],
    rating: 7,
    description:
        'Doing private teaching lessons on advanced physics for physics students for the past 8 years',
    title: 'Physicist',
    subjects: ['Physics', 'Maths'],
    email: 'alextsafos@gmail.com',
    linkedIn: 'Alex Tsafos',
    facebook: 'Alex Tsafos',
  ),
  Assistant(
    id: 2,
    username: 'bill',
    firstName: 'Bill',
    lastName: 'Vrettos',
    bookmarkedAssistants: [],
    rating: 9,
    description:
        'Specialized in electronics, microprocessors and everything considered low-level programming. BSc in ECE',
    title: 'Compilers Engineer',
    subjects: ['Compilers', 'VLSI', 'Microprocessors'],
    email: 'alextsafos@gmail.com',
    linkedIn: 'Alex Tsafos',
    facebook: 'Alex Tsafos',
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
    email: 'alextsafos@gmail.com',
    linkedIn: 'Alex Tsafos',
    facebook: 'Alex Tsafos',
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
    email: 'alextsafos@gmail.com',
    linkedIn: 'Alex Tsafos',
    facebook: 'Alex Tsafos',
  ),
];

final _chatSessions = [
  ChatSession(
    from: _assistants[1],
    lastMessage: "Εγινε ευχαριστώ",
    messages: [
      TextMessage(
        author: _assistants[1].toChatUser(),
        createdAt: DateTime.now().add(const Duration(minutes: 3)).millisecondsSinceEpoch,
        id: '126',
        text: "Πήρα ΑΑΥ 11",
      ),
      TextMessage(
        author: _assistants[0].toChatUser(),
        createdAt: DateTime.now().add(const Duration(minutes: 2)).millisecondsSinceEpoch,
        id: '125',
        text: "Τι κάνεις",
      ),
      TextMessage(
        author: _assistants[1].toChatUser(),
        createdAt: DateTime.now().add(const Duration(minutes: 1)).millisecondsSinceEpoch,
        id: '124',
        text: "Γεια σου",
      ),
      TextMessage(
        author: _assistants[0].toChatUser(),
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: '123',
        text: "Γεια",
      ),
    ],
  ),
  ChatSession(from: _assistants[2], lastMessage: "Εγινε ευχαριστώ", messages: [
    TextMessage(
      author: _assistants[2].toChatUser(),
      createdAt: DateTime.now().add(const Duration(minutes: 3)).millisecondsSinceEpoch,
      id: '126',
      text: "Πήρα ΑΑΥ 11",
    ),
    TextMessage(
      author: _assistants[0].toChatUser(),
      createdAt: DateTime.now().add(const Duration(minutes: 2)).millisecondsSinceEpoch,
      id: '125',
      text: "Τι κάνεις",
    ),
    TextMessage(
      author: _assistants[2].toChatUser(),
      createdAt: DateTime.now().add(const Duration(minutes: 1)).millisecondsSinceEpoch,
      id: '124',
      text: "Γεια σου",
    ),
    TextMessage(
      author: _assistants[0].toChatUser(),
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: '123',
      text: "Καλησπέρα!",
    ),

  ],),
];
