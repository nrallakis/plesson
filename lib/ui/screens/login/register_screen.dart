import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  late bool _obscurePassword;


  @override
  void initState() {
    super.initState();
    _obscurePassword = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: _buildRegisterForm(),
      ),
    );
  }

  Widget _buildRegisterForm() {
    return Form(
      key: _key,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'First Name',
                filled: true,
                isDense: true,
              ),
              keyboardType: TextInputType.name,
              autocorrect: false,
              validator: (val) => _validateRequired(val, 'First Name'),
            ),
            const SizedBox(
              height: 17,
            ),
            TextFormField(
            decoration: const InputDecoration(
              labelText: 'Last Name',
              filled: true,
              isDense: true,
            ),
            keyboardType: TextInputType.name,
            autocorrect: false,
              validator: (val) => _validateRequired(val, 'Last Name'),
          ),
            const SizedBox(
              height: 17,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Username',
                filled: true,
                isDense: true,
              ),
              keyboardType: TextInputType.name,
              autocorrect: false,
              validator: (val) => _validateRequired(val, 'Username'),
            ),
            const SizedBox(
              height: 17,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                filled: true,
                isDense: true,
              ),
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              validator: _validateEmail,
            ),
            const SizedBox(
              height: 17,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                filled: true,
                isDense: true,
              ),
              obscureText: _obscurePassword,
              validator: (val) => _validateRequired(val, 'Password'),
            ),
            const SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.roboto(),
                  ),
                  style:
                  ElevatedButton.styleFrom(fixedSize: const Size(100, 35)),
                ),
                ElevatedButton(
                  onPressed: _validateFormAndRegister,
                  child: Text(
                    "Register",
                    style: GoogleFonts.roboto(),
                  ),
                  style:
                  ElevatedButton.styleFrom(fixedSize: const Size(100, 35)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String? _validateRequired(String? val, fieldName) {
    if (val == null || val == '') {
      return '$fieldName is required';
    }
    return null;
  }

  String? _validateEmail(String? value) {
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

  void _validateFormAndRegister() {
    // Get form state from the global key
    var formState = _key.currentState;

    // check if form is valid
    if (formState!.validate()) {
      Navigator.pushNamed(context, home);
    } else {
    }
  }
}

