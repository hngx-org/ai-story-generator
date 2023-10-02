import 'package:ai_story_generator/core/app_export.dart';
import 'package:ai_story_generator/screens/history/user_chat_container.dart';
import 'package:flutter/material.dart';

class IndividualAiChatScreen extends StatelessWidget {
  const IndividualAiChatScreen({super.key, required this.screenType});
  final String screenType;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            size: getProportionateScreenWidth(29),
          ),
        ),
        centerTitle: true,
        title: customNormalText(
            inputText: screenType,
            fontSize: 32,
            weight: FontWeight.w800,
            colorName: AppTheme.blackColor),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(24),),
            child: UserChatContainer()
          );
        },
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: AppTheme.whiteColor,
      //     elevation: 0,
      //     child: Icon(
      //       Icons.share_rounded,
      //       color: AppTheme.shareColor,
      //       size: getProportionateScreenWidth(31),
      //     ),
      //     onPressed: () {}),
    );
  }
}
