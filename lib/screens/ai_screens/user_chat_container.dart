import 'package:ai_story_generator/core/app_export.dart';
import 'package:flutter/material.dart';

class UserChatContainer extends StatelessWidget {
  const UserChatContainer({super.key, required this.inputText});
  final String inputText;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Image.asset(
            ImageConstant.profileAvatar,
            scale: 4,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: customNormalText(
              inputText: inputText,
              fontSize: 18,
              weight: FontWeight.w500,
              colorName: AppTheme.blackColor,
            ),
          ),
        ),
      ],
    );
  }
}
