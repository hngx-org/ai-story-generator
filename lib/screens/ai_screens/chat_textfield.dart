import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    required this.textController,
    this.onTap,
    required this.hintText,
    this.suffixIcon,
    InputDecoration? decoration,
    required this.aiResponse,
  });
  final TextEditingController textController;
  final Function()? onTap;
  final String hintText;
  final Widget? suffixIcon;
  final bool aiResponse;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: TextField(
        controller: textController,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          suffixIcon: aiResponse
              ? GestureDetector(
                  onTap: onTap,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: SvgPicture.asset("assets/svg_images/send.svg"),
                  ),
                )
              : SizedBox(
                  width: 10,
                  height: 10,
                  child: CircularProgressIndicator.adaptive(
                    strokeWidth: 4,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.black,
                    ),
                  ),
                ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 1,
              color: Color(0xFF323232),
            ),
          ),
        ),
      ),
    );
  }
}
