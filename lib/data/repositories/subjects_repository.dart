class SubjectsRepository {
  List<String> getAllSubjects() {
    return [
      'Maths',
      'Physics',
      'Chemistry',
      'UI/UX',
      'Programming',
      'Compilers',
      'VLSI',
      'Microprocessors',
      'AI',
      'Robotics',
      'Quantum Physics',
      'Economics',
    ];
  }

  final Map<String, List<String>> _keywords = {
    'NTUA': [
      'Maths',
      'Physics',
      'Chemistry',
      'Programming',
      'Compilers',
      'VLSI',
      'Microprocessors',
      'AI',
      'Robotics',
      'Quantum Physics'
    ],
    'NUA': ['UI/UX', 'Programming', 'Economics', 'Quantum Physics'],
  };

  /// Returns null if no project is found with given keyword
  List<String> getSubjectByKeyword(String keyword) {
    if (_keywords.containsKey(keyword.toUpperCase())) {
      return _keywords[keyword]!;
    }
    if (getAllSubjects().contains(keyword)) {
      return [keyword];
    }
    return [];
  }
}
