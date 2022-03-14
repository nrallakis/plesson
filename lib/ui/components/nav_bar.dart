import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/assistant.dart';
import '../../routes.dart' as routes;

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
    Assistant user = context.read<Assistant>();

    return AppBar(title: Text(widget.pageName), actions: [
      if (widget.showAvatar == true)
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, routes.userProfile);
          },
          child: Avatar(name: user.firstName, size: 40, imagePath: user.imagePath),
        ),
    ]);
  }
}