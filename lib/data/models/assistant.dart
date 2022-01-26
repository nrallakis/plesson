class Assistant {
  int id;
  String username;
  String firstName;
  String lastName;
  String title;
  String description;
  List<String> subjects;
  /// Bookmarked assistants by id
  List<int> bookmarkedAssistants;
  int rating;

  String? imagePath;

  Assistant({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.title,
    required this.description,
    required this.subjects,
    required this.bookmarkedAssistants,
    required this.rating,
    this.imagePath,
  });
}
