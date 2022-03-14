import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';

class Avatar extends StatelessWidget {
  final String name;
  final double size;
  final String? imagePath;

  const Avatar({
    required this.name,
    this.size = 60,
    this.imagePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imagePath == null ?
      _textAvatar(name, size) : _imageAvatar(imagePath!, size);
  }

  Widget _imageAvatar(String path, double size) {
    return CircleAvatar(
      radius: size/2, // Image radius
      backgroundImage: Image.asset(path, filterQuality: FilterQuality.high).image,
    );
  }

  Widget _textAvatar(String name, double size) {
    return Container(
      child: Center(
        child: Text(
          name.characters.first,
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: avatarTextColor,
              fontSize: size / 2.4,
            ),
          ),
        ),
      ),
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: avatarBackground,
        shape: BoxShape.circle,
      ),
    );
  }
}
