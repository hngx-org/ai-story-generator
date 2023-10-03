import 'package:ai_story_generator/core/app_export.dart';
import 'package:ai_story_generator/screens/ai_screens/ai_chat_controller.dart';
import 'package:ai_story_generator/screens/ai_screens/chat_textfield.dart';
import 'package:ai_story_generator/screens/ai_screens/user_chat_container.dart';
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
              setState(() {
                _aiController.aiInput.clear();
              });
            },
            icon: Icon(
              Icons.delete_outline_rounded,
              size: getProportionateScreenWidth(28),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
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
                      inputText: _aiController.aiInput[index]["ai"].toString(),
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
              hintText: "Enter Description",
              aiResponse: aiResponse,
              onTap: () async {
                if (_aiController.textInputController.text.isNotEmpty) {
                  _dismissKeyboard(context);
                  setState(() {
                    aiResponse = false;
                    _aiController.aiInput
                        .add({"user": _aiController.textInputController.text});
                    _aiController.textInputController.clear();
                  });
                  _moveToBottomView();
                  await Future.delayed(Duration(seconds: 5));
                  _moveToBottomView();

                  setState(() {
                    aiResponse = true;
                    _aiController.aiInput.add({
                      "ai":
                          "Lorem ipsum dolor sit amet consectetur. Phasellus leo felis ac ut a eu. Id tincidunt scelerisque malesuada etiam elit sodales sem amet suspendisse. Tortor vitae vulputate ipsum risus dignissim adipiscing lobortis. Porttitor volutpat dolor faucibus lobortis dis orci et et. Senectus id pulvinar odio. \n\nfermentum elementum tellus ut mauris. Fringilla pellentesque lorem neque volutpat. Eu morbi dui morbi aliquam eu consequat blandit dignissim dolor. Nullam interdum sed etiam at id varius nunc. Consectetur id vitae purus. \n\nrhoncus volutpat velit ac bibendum nisi. Id ipsum amet eu sem porta auctor vestibulum. Mauris nunc enim est lorem velit velit. Justo tristique dictum euismod id eros lorem orci mauris. Aliquet in blandit nibh commodo praesent euismod a. Dolor eleifend quam tempus quispellentesque gravida. Sagittis vulputate egestas eget aliquet odio. Amet rutrum pellentesque aliquam tempus nibh. \n\nsollicitudin odio netus ac. Aenean vulputate morbi tempus gravida. Tincidunt turpis purus rutrum amet tincidunt. Ut nunc ut suspendisse nisi ut. Tellus proin rhoncus mauris a lacus. Vel viverra aliquet imperdiet eget integer netus. Commodo dignissim ultricies tellus viverra vulputate est vive tristique. Porttitor at hendrerit adipiscing phasellus facilisis vulputate. In varius cras imperdiet pretium in tellus tempus blandit imperdiet."
                    });
                  });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
