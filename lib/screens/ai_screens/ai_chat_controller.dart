import 'package:ai_story_generator/core/app_export.dart';
import 'package:ai_story_generator/widgets/ai_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AiChatContainer extends StatelessWidget {
  const AiChatContainer({
    super.key,
    required this.inputText,
    required this.onSaved,
    required this.textController,
  });
  final String inputText;
  final Function() onSaved;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Image.asset(
            ImageConstant.chatBotImage,
            scale: 5,
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppTheme.plansContainerColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    showAiDialog(context, onSaved, textController);
                  },
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.save_alt_rounded,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ),
                SelectableText(
                  inputText,
                  style: GoogleFonts.abhayaLibre(
                    fontSize: getProportionateScreenWidth(16),
                    fontWeight: FontWeight.w400,
                    color: AppTheme.blackColor,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
