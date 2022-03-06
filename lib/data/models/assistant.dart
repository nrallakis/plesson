class Assistant {
  int id;
  String username;
  String firstName;
  String lastName;
  String title;
  String email;
  String facebook;
  String linkedIn;
  String description;
  List<String> subjects;
  String? imageUrl;
  String? imagePath;
  /// IDs of bookmarked assistants
  List<int> bookmarkedAssistants;
  int rating;

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
    required this.email,
    required this.facebook,
    required this.linkedIn,
    this.imagePath,
  });

  Assistant.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      username = json['username'],
      firstName = json['firstName'],
      lastName = json['lastName'],
      title = json['title'],
      description = json['description'],
      subjects = json['subjects'].toString().split(','),
      bookmarkedAssistants = json['bookmarkedAssistants'].toString().split(',').map((String id) => )


  Map<String, dynamic> toJson() => {
    'id' : id,
    ''
  };

  String get fullName => "$firstName $lastName";

  String get contactDetails => "Facebook: $facebook\nLinkedIn: $linkedIn\nEmail: $email";

  String get educationDetails => "2012-2019: Lorem ipsum dolor\n2019-2020: Etiam vitae nunc sed ipsum\n2020-2021: Flutter bootcamp";
}
