import 'package:ai_story_generator/core/app_export.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';

class IndividualStoryScreen extends StatelessWidget {
  const IndividualStoryScreen(
      {super.key, required this.content, required this.title});
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
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
            inputText: title,
            fontSize: 32,
            weight: FontWeight.w800,
            colorName: AppTheme.blackColor),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customJustifiedText(
                  inputText: content,
                  fontSize: 16,
                  weight: FontWeight.w400,
                  colorName: AppTheme.blackColor)
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.whiteColor,
        elevation: 0,
        child: Icon(
          Icons.share_rounded,
          color: AppTheme.shareColor,
          size: getProportionateScreenWidth(31),
        ),
        onPressed: () {
          shareMethod(context);
        },
      ),
    );
  }

  // _onShare method:
  shareMethod(
    context,
  ) async {
    final box = context.findRenderObject() as RenderBox?;

    await Share.share(
      content,
      subject: title,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }
}
