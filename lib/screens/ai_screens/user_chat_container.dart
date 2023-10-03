import 'package:ai_story_generator/core/app_export.dart';
import 'package:flutter/material.dart';

class UserChatContainer extends StatelessWidget {
  const UserChatContainer({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: customNormalText(
          inputText: "inputText",
          fontSize: 16,
          weight: FontWeight.w500,
          colorName: AppTheme.blackColor),
    );
  }
}
