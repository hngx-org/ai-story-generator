import 'package:ai_story_generator/core/app_export.dart';
import 'package:flutter/material.dart';

showAiDialog(BuildContext context, Function() saveOnTap,
    TextEditingController textController) {
  return showDialog<void>(
    context: context,
    // barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return FittedBox(
        child: AlertDialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          actionsPadding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
          actionsAlignment: MainAxisAlignment.spaceAround,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customNormalText(
                    inputText: "Enter Story title",
                    fontSize: 18,
                    weight: FontWeight.w800,
                    colorName: AppTheme.blackColor,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.close),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: TextField(
                  controller: textController,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                    hintStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0xFF323232),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          actions: <Widget>[
            InkWell(
              onTap: saveOnTap,
              child: customNormalText(
                inputText: "SAVE",
                fontSize: 16,
                weight: FontWeight.w800,
                colorName: AppTheme.primaryColor,
              ),
            ),
          ],
        ),
      );
    },
  );
}
