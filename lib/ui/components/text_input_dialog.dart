import 'package:flutter/material.dart';

class TextInputDialog extends StatefulWidget {
  final Function(String?) onResult;
  final String? text;
  final String? hint;

  const TextInputDialog({Key? key, required this.onResult, this.text, this.hint}) : super(key: key);

  @override
  _TextInputDialogState createState() => _TextInputDialogState();
}

class _TextInputDialogState extends State<TextInputDialog> {
  final TextEditingController _textFieldController = TextEditingController();
  String? _input;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.text ?? ""),
      content: TextField(
        onChanged: (value) {
          _input = value;
        },
        controller: _textFieldController,
        decoration: InputDecoration(hintText: widget.hint ?? ""),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('CANCEL'),
          onPressed: () {
            Navigator.pop(context);
            widget.onResult(null);
          },
        ),
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.pop(context);
            widget.onResult(_input);
          },
        ),
      ],
    );
  }
}
