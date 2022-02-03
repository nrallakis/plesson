import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OpenAppScreen extends StatelessWidget {
  const OpenAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(child: Image.asset('assets/icons/logo.png')),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Log-in",
                    style: GoogleFonts.roboto(),
                  ),
                  style: ElevatedButton.styleFrom(fixedSize: const Size(100, 35)),
                ),
                const SizedBox(width: 40),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "Register",
                    style: GoogleFonts.roboto(),
                  ),
                  style: ElevatedButton.styleFrom(fixedSize: const Size(100, 35)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
