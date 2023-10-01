import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.textFieldController,
  });
  final String labelText;
  final String hintText;
  final TextEditingController textFieldController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textFieldController,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
