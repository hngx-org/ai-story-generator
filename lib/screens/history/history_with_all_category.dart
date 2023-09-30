import 'package:ai_story_generator/themes/app_theme.dart';
import 'package:ai_story_generator/widgets/custom_text.dart';
import 'package:ai_story_generator/widgets/size_config.dart';
import 'package:flutter/material.dart';

class HistoryWithAllCategory extends StatelessWidget {
  const HistoryWithAllCategory({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SizedBox(
        height: getProportionateScreenHeight(100),
        width: getProportionateScreenWidth(200),
        child: customCentreText(
            inputText: 'This is a test',
            fontSize: 60,
            weight: FontWeight.bold,
            colorName: AppTheme.redColor),
      ),
    );
  }
}
