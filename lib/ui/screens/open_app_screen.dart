import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OpenAppScreen extends StatelessWidget {
  const OpenAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset('assets/icons/logo.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {}, child: Text("Log-in", style: GoogleFonts.roboto(),),
                  style: ElevatedButton.styleFrom(fixedSize: const Size(100, 35)),
                ),
                const SizedBox(width: 40),
                OutlinedButton(onPressed: () {}, child: Text("Register")),
              ],
            ),
          ],
        ),
    );
  }
}
