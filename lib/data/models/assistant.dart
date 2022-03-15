import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Assistant extends ChangeNotifier with EquatableMixin {

  String _title;
  String get title => _title;

  set title(String title) {
    _title = title;
    notifyListeners();
  }

  String _email;
  String get email => _email;

  set email(String email) {
    _email = email;
    notifyListeners();
  }

  String _description;
  String get description => _description;

  set description(String description) {
    _description = description;
    notifyListeners();
  }

  final List<String> _subjects;
  UnmodifiableListView<String> get subjects => UnmodifiableListView(_subjects);


  String _facebook;
  String get facebook => _facebook;

  set facebook(String facebook) {
    _facebook = facebook;
    notifyListeners();
  }

  String _linkedIn;
  String get linkedIn => _linkedIn;

  set linkedIn(String linkedIn) {
    _linkedIn = linkedIn;
    notifyListeners();
  }

  int id;
  String username;
  String firstName;
  String lastName;
  String? imageUrl;
  String? imagePath;

  /// IDs of bookmarked assistants
  List<int> bookmarkedAssistants;
  int rating;

  Assistant.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        _title = json['title'],
        _description = json['description'],
        _subjects = json['subjects'].cast<String>(),
        bookmarkedAssistants = json['bookmarkedAssistants'].cast<int>(),
        rating = json['rating'],
        _email = json['email'],
        _facebook = json['facebook'],
        _linkedIn = json['linkedIn'],
        imagePath = json['imagePath'];

  Assistant({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required String description,
    required String title,
    required List<String> subjects,
    required this.bookmarkedAssistants,
    required this.rating,
    required String email,
    required String facebook,
    required String linkedIn,
    this.imagePath,
  })  : _subjects = subjects,
        _title = title,
        _email = email,
        _description = description,
        _facebook = facebook,
        _linkedIn = linkedIn;

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'firstName': firstName,
        'lastName': lastName,
        'title': title,
        'description': description,
        'subjects': subjects,
        'bookmarkedAssistants': bookmarkedAssistants,
        'rating': rating,
        'email': email,
        'facebook': facebook,
        'linkedIn': linkedIn,
        'imagePath': imagePath,
      };

  String get fullName => "$firstName $lastName";

  String get contactDetails => "Facebook: $facebook\nLinkedIn: $linkedIn\nEmail: $email";

  String get educationDetails =>
      "2012-2019: Lorem ipsum dolor\n2019-2020: Etiam vitae nunc sed ipsum\n2020-2021: Flutter bootcamp";

  void addSubject(String subject) {
    _subjects.add(subject);
    notifyListeners();
  }

  void removeSubject(String subject) {
    _subjects.remove(subject);
    notifyListeners();
  }

  @override
  List<Object?> get props => [
        id,
        username,
        firstName,
        lastName,
        title,
        email,
        facebook,
        linkedIn,
        description,
        subjects,
        imageUrl,
        imagePath,
        bookmarkedAssistants,
        rating
      ];
}
