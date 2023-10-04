import 'package:ai_story_generator/core/app_export.dart';
import 'package:flutter/material.dart';

showMyDialog(BuildContext context, Function() yesOnTap) {
  return showDialog<void>(
    context: context,
    // barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        actionsPadding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
        actionsAlignment: MainAxisAlignment.spaceAround,
        content: customNormalText(
          inputText: "Are you sure you want to\nlog Out?",
          fontSize: 18,
          weight: FontWeight.w800,
          colorName: AppTheme.blackColor,
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Get.back();
            },
            child: customNormalText(
              inputText: "NO",
              fontSize: 16,
              weight: FontWeight.w400,
              colorName: AppTheme.redColor,
            ),
          ),
          InkWell(
            onTap: yesOnTap,
            child: customNormalText(
              inputText: "YES",
              fontSize: 16,
              weight: FontWeight.w400,
              colorName: AppTheme.primaryColor,
            ),
          ),
        ],
      );
    },
  );
}
