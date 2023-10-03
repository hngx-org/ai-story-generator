import 'package:ai_story_generator/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../core/utils/progress_dialog_utils.dart';

class AiChatContainer extends StatelessWidget {
  const AiChatContainer({super.key, required this.inputText,});
  final String inputText;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          ImageConstant.chatBotImage,
          scale: 4,
        ),
        Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.plansContainerColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: customJustifiedText(
                    inputText: inputText,
                    fontSize: 16,
                    weight: FontWeight.w400,
                    colorName: AppTheme.blackColor,
                  ),
                ),
              )
            
      ],
    );
  }
}
