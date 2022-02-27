import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plesson/constants.dart';

class Avatar extends StatelessWidget {
  final String name;
  final double size;

  const Avatar({
    required this.name,
    this.size = 60,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
