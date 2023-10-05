import 'package:ai_story_generator/controller/history_controller.dart';
import 'package:ai_story_generator/core/app_export.dart';
import 'package:ai_story_generator/main.dart';
import 'package:ai_story_generator/screens/ai_screens/ai_chat_controller.dart';
import 'package:ai_story_generator/screens/ai_screens/chat_textfield.dart';
import 'package:ai_story_generator/screens/ai_screens/user_chat_container.dart';
import 'package:ai_story_generator/screens/history_screens/dashboard.dart';
import 'package:flutter/material.dart';
import '../../controller/ai_controller.dart';

class IndividualAiChatScreen extends StatefulWidget {
  const IndividualAiChatScreen({super.key, required this.screenType});
  final String screenType;

  @override
  State<IndividualAiChatScreen> createState() => _IndividualAiChatScreenState();
}

class _IndividualAiChatScreenState extends State<IndividualAiChatScreen> {
  final ScrollController _scrollController = ScrollController();
  bool aiResponse = true;

  void _dismissKeyboard(BuildContext context) {
    // Use FocusScope to unfocus (dismiss) the keyboard
    FocusScope.of(context).unfocus();
  }

  void _moveToBottomView() {
    print("got here");
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _aiController = Get.put(AiController());
    final _historyController = Get.put(HistoryController());
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            size: getProportionateScreenWidth(30),
          ),
        ),
        centerTitle: true,
        title: customNormalText(
          inputText: widget.screenType,
          fontSize: 32,
          weight: FontWeight.w800,
          colorName: AppTheme.blackColor,
        ),
        actions: [
          IconButton(
            onPressed: () {
              // _historyController.addstoriesItem({
              //   "Id": localStorage.read("id"),
              //   "Title": "hey",
              //   "Story": "story"
              // });
              setState(() {
                _aiController.aiInput.clear();
              });
            },
            icon: Icon(
              Icons.delete_outline_rounded,
              size: getProportionateScreenWidth(28),
              color: AppTheme.redColor,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _aiController.aiInput.isEmpty
              ? Expanded(
                  child: Center(
                    child: Image.asset(
                      ImageConstant.startChat,
                      scale: 5,
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: _aiController.aiInput.length,
                    itemBuilder: (context, index) {
                      if (index == 0 || index % 2 == 0) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(24),
                          ),
                          child: UserChatContainer(
                            inputText:
                                _aiController.aiInput[index]["user"].toString(),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(24),
                          ),
                          child: AiChatContainer(
                            inputText: _aiController.aiInput[index]["ai"] !=
                                    null
                                ? _aiController.aiInput[index]["ai"].toString()
                                : "I can not process this request",
                            onSaved: () {
                              saveOptions(
                                widget.screenType,
                                _historyController,
                                _aiController,
                                index,
                              );
                              // _aiController.aiInput.clear();
                              _aiController.storyTitleController.clear();
                              _aiController.textInputController.clear();
                              Get.off(const DashBoardScreen());
                            },
                            textController: _aiController.storyTitleController,
                          ),
                        );
                      }
                    },
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ChatTextField(
              textController: _aiController.textInputController,
              hintText: "Enter ${widget.screenType} Description",
              aiResponse: aiResponse,
              onTap: () async {
                if (_aiController.textInputController.text.isNotEmpty) {
                  _dismissKeyboard(context);

                  setState(() {
                    aiResponse =
                        false; // The send Icon changes to a loading Icon
                    _aiController.aiInput
                        .add({"user": _aiController.textInputController.text});
                    _aiController.textInputController.clear();
                  });

                  String response = await _aiController.generateStories(
                    widget.screenType,
                    // widget.screenType,
                  );
                  if (response == "false") {
                    setState(() {
                      aiResponse = true;
                      // _aiController.aiInput.clear();
                    });
                  }

                  print("3333 ai res $response");
                  _moveToBottomView();
                  await Future.delayed(const Duration(
                      seconds: 5)); //Delays the following actions for 5 seconds
                  // _moveToBottomView();

                  if (response != "false") {
                    setState(() {
                      aiResponse =
                          true; // The loading Icons reverts back to the send Icon after ai response
                      _aiController.aiInput.add({"ai": response});
                    });
                  }
                }
              },
            ),
          )
        ],
      ),
    );
  }

  saveOptions(String screenType, HistoryController historyController,
      AiController aiController, int index) {
    if (screenType == "Stories") {
      print("stories");
      historyController.addstoriesItem({
        "Id": localStorage.read("id"),
        "Title": aiController.storyTitleController.text.trim(),
        "Story": aiController.aiInput[index]["ai"].toString()
      });
    } else if (screenType == "Poem") {
      print("Poems");
      historyController.addPoemsItem({
        "Id": localStorage.read("id"),
        "Title": aiController.storyTitleController.text.trim(),
        "Story": aiController.aiInput[index]["ai"].toString()
      });
    } else if (screenType == "Creative Writing") {
      print("creative writing");
      historyController.addCreativeWritingsItem({
        "Id": localStorage.read("id"),
        "Title": aiController.storyTitleController.text.trim(),
        "Story": aiController.aiInput[index]["ai"].toString()
      });
    }
  }
}
