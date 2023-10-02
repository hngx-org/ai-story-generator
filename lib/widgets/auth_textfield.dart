import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.textFieldController,
    this.isObsure = false,
    this.suffixIcon,
  });
  final String labelText;
  final String hintText;
  final TextEditingController textFieldController;
  final bool isObsure;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObsure,
      controller: textFieldController,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w300,
          fontFamily: GoogleFonts.abhayaLibre.toString(),
          fontSize: 15,
        ),
      ),
    );
  }
}
