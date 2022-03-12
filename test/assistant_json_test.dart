import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:plesson/data/models/assistant.dart';

import 'fixtures/fixture_reader.dart';

final assistant = Assistant(
  id: 0,
  username: 'user',
  firstName: 'Nicholas',
  lastName: 'Rallakis',
  bookmarkedAssistants: [1, 2, 3],
  rating: 8,
  description: 'Bsc in Maths. Can also assist in Physics and Chemistry. I also teach Algorithms, Data Structures & Programming languages.',
  title: 'Maths',
  subjects: ["Maths", "AI"],
  email: 'nrallakis4@gmail.com',
  linkedIn: 'Nicholas Rallakis',
  facebook: 'Nicholas Rallakis',
);

void main() {
  group('toJson', () {
    test('should return correct JSON', () {
      var actual = assistant.toJson();
      var expected = jsonDecode(fixture('assistant.json'));
      expect(actual, expected);
    });
  });

  group('fromJson', () {
    test('should parse JSON correctly', () {
      var json = jsonDecode(fixture('assistant.json'));
      expect(Assistant.fromJson(json), assistant);
    });
  });
}