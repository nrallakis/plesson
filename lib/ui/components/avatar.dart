import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plesson/constants.dart';

class Avatar extends StatelessWidget {
  final String name;

  const Avatar({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          name.characters.first,
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              color: avatarTextColor,
              fontSize: 22,
            ),
          ),
        ),
      ),
      width: 50,
      height: 50,
      decoration: const BoxDecoration(color: avatarBackground, shape: BoxShape.circle),
    );
  }
}
