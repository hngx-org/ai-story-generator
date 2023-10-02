import 'package:ai_story_generator/screens/ai_stories/story_list.dart';
import 'package:ai_story_generator/screens/ai_stories/with_all_category.dart';
import 'package:flutter/material.dart';

import '../../core/app_export.dart';

class YourStoryScreen extends StatefulWidget {
  YourStoryScreen({super.key});

  @override
  State<YourStoryScreen> createState() => _YourStoryScreenState();
}

class _YourStoryScreenState extends State<YourStoryScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: customNormalText(
              inputText: 'Your Stories',
              fontSize: 32,
              weight: FontWeight.w800,
              colorName: AppTheme.blackColor),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(37)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(24)),
                child: SizedBox(
                  height: getProportionateScreenHeight(50),
                  width: getProportionateScreenWidth(346),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tabs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                            Get.to(WithAllCategoryScreen());
                          },
                          child: AnimatedContainer(
                            duration: Duration(microseconds: 300),
                            margin: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(8)),
                            padding: EdgeInsets.symmetric(
                                horizontal: index == 1
                                    ? getProportionateScreenWidth(10)
                                    : getProportionateScreenWidth(15)),
                            height: getProportionateScreenHeight(30),
                            // width:index == 1? getProportionateScreenWidth(126) : getProportionateScreenWidth(40),
                            decoration: BoxDecoration(
                                color: selectedIndex == index
                                    ? AppTheme.primaryColor
                                    : AppTheme.whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: selectedIndex == index
                                        ? AppTheme.primaryColor
                                        : AppTheme.black50Color)),
                            child: Center(
                              child: customNormalText(
                                  inputText: tabs[index].title,
                                  fontSize: 16,
                                  weight: FontWeight.w500,
                                  colorName: selectedIndex == index
                                      ? AppTheme.whiteColor
                                      : AppTheme.blackColor),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(100),
              ),
              StoryList()
            ],
          ),
        ));
  }
}

class TopTabModel {
  final String title;

  TopTabModel({
    required this.title,
  });
}

List<TopTabModel> tabs = [
  TopTabModel(
    title: 'Stories',
  ),
  TopTabModel(
    title: 'Creative writing',
  ),
  TopTabModel(
    title: 'Poems',
  ),
];
