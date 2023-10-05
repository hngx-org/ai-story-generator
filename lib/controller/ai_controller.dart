import 'package:ai_story_generator/core/extensions/extensions.dart';
import 'package:ai_story_generator/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hngx_openai/repository/openai_repository.dart';

class AiController extends GetxController {
  final TextEditingController textInputController = TextEditingController();
  final TextEditingController storyTitleController = TextEditingController();
  List<Map<String, String>> aiInput = [];
  List<Map<String, String>> savedStories = [];
  bool aiResponse = true;
  // String prompt =
  //     "Generate only stories and when the conversation goes out of this context, kindly inform the user that you only respond to generating stories and nothing more";

  generateStories(String prompt, String sPrompt) async {
    print("got here");
    aiResponse = false;
    OpenAIRepository openAI = OpenAIRepository();
    //
    List<String> history = [prompt, "Generate a $sPrompt"];
    final response = await openAI.getChatCompletions(
        history,
        "$prompt now generate ${textInputController.text.trim()}",
        localStorage.read("cookie"));

    print("------ ai cookies ${response}");

    if (response.startsWith('M')) {
      // If the return String is a Message
      print("This is a Success Text");
      return response.substring(8).trim();
    } else {
      // If the return String is an Error
      print("This is an Error Text");
      errorSnackbar(response);
      return "false";
    }
  }
}
