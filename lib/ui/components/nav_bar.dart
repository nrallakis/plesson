import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/assistant.dart';
import '../../routes.dart';
import 'avatar.dart';

class NavBar extends StatelessWidget {

  final String pageName;
  final Assistant? currentUser;

  const NavBar({
    required this.pageName,
    this.currentUser,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageName),
        actions: [
          if (currentUser != null) {
            Avatar(name: currentUser!.firstName)
          }
        ]
      ),
    );
  }
}