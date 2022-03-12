import 'package:flutter/material.dart';
import 'package:plesson/data/repositories/assistants_repository.dart';
import 'package:plesson/routes.dart' as routes;

import 'avatar.dart';

class NavBar extends StatefulWidget implements PreferredSizeWidget {
  const NavBar({Key? key, required this.pageName, this.showAvatar = true}) : preferredSize = const Size.fromHeight(kToolbarHeight), super(key: key);

  final String pageName;
  final bool showAvatar;

  @override
  final Size preferredSize; // default is 56.0

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar>{
  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(widget.pageName), actions: [
      if (widget.showAvatar == true)
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, routes.userProfile, arguments: currentUser);
          },
          child: Avatar(name: currentUser.firstName, size: 40,),
        ),
    ]);
  }
}