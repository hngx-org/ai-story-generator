import 'package:ai_story_generator/core/app_export.dart';
import 'package:ai_story_generator/screens/history_screens/individual_story.dart';
import 'package:flutter/material.dart';
import 'package:iconamoon/iconamoon.dart';

class StoryList extends StatefulWidget {
  const StoryList({super.key});

  @override
  State<StoryList> createState() => _StoryListState();
}

class _StoryListState extends State<StoryList> {
  late PageController _pageController;
  double? _currentPage = 0.0;
  // int? _selectedIndex;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page;
      });
    });
    // _selectedIndex = _currentPage!.toInt();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(300),
      width: getProportionateScreenWidth(390),
      child: PageView.builder(
          controller: _pageController,
          itemCount: storyList.length, // Change to the number of pages you want
          itemBuilder: (context, index) {
            // Calculate the scale and height transition for the current page
            // double scale = 1.0 - (_currentPage! - index).abs() * 0.2;
            // double height = 200 * scale;
            return GestureDetector(
              onTap: () {
                Get.to(IndividualStoryScreen());
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 50, 20, 30),
                  margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(11)),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _currentPage == index
                          ? AppTheme.whiteColor
                          : AppTheme.blackColor,
                    ),
                    color: _currentPage == index
                        ? AppTheme.storyColor
                        : AppTheme.whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      customCentreText(
                          inputText: storyList[index].title,
                          fontSize: 22,
                          weight: FontWeight.w500,
                          colorName: AppTheme.blackColor),
                      SizedBox(
                        height: getProportionateScreenHeight(42),
                      ),
                      Icon(
                        IconaMoon.edit,
                        size:
                            //  selectedIndex == index
                            //     ? getProportionateScreenWidth(81)
                            //     :
                            getProportionateScreenWidth(54),
                        color: AppTheme.iconColor,
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class TabModel {
  final String title;

  TabModel({
    required this.title,
  });
}

List<TabModel> storyList = [
  TabModel(
    title: 'The River',
  ),
  TabModel(
    title: 'The Ocean',
  ),
  TabModel(
    title: 'The City',
  ),
  TabModel(
    title: 'The Nile',
  ),
  TabModel(
    title: 'The Bush',
  ),
];
