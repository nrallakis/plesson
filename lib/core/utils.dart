import 'dart:convert';
import 'dart:math';

String randomId() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

String? validateRequired(String? val, fieldName) {
  if (val == null || val == '') {
    return '$fieldName is required';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value == '') {
    return 'Email is required';
  }
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);

  if (!regex.hasMatch(value)) {
    return 'Enter valid email address';
  }
  return null;
}