import 'package:ai_story_generator/core/app_export.dart';
import 'package:ai_story_generator/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconamoon/iconamoon.dart';

import '../../controller/ai_controller.dart';

class StoryList extends StatefulWidget {
  const StoryList({super.key});

  @override
  State<StoryList> createState() => _StoryListState();
}

class _StoryListState extends State<StoryList> {
  String? stories;
  @override
  void initState() {
    // TODO: implement initState
    stories = localStorage.read("Stories");
    print("Stories  $stories");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _aiController = Get.put(AiController());
    print("------- ${_aiController.savedStories.length}");
    return _aiController.savedStories.isEmpty
        ? Center(
            child: Image.asset(
              ImageConstant.notebook,
              scale: 5,
            ),
          )
        : CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              aspectRatio: 1,
              enableInfiniteScroll: false,
            ),
            items: _aiController.savedStories
                .map((mapString) => GestureDetector(
                      onTap: () {
                        print("------- ${_aiController.savedStories.length}");
                        // Get.to(IndividualStoryScreen());
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
                        width: 250,
                        margin: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(11),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.blackColor,
                          ),
                          color: AppTheme.whiteColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            customCentreText(
                                inputText: mapString["Title"].toString(),
                                fontSize: 22,
                                weight: FontWeight.w500,
                                colorName: AppTheme.blackColor),
                            SizedBox(
                              height: getProportionateScreenHeight(42),
                            ),
                            Icon(
                              IconaMoon.edit,
                              size: getProportionateScreenWidth(54),
                              color: AppTheme.iconColor,
                            )
                          ],
                        ),
                      ),
                    ))
                .toList());
  }
}

    // PageView.builder(
    //     controller: _pageController,
    //     itemCount: storyList.length, // Change to the number of pages you want
    //     itemBuilder: (context, mapString) {
    //       // Calculate the scale and height transition for the current page
    //       // double scale = 1.0 - (_currentPage! - mapString).abs() * 0.2;
    //       // double height = 200 * scale;
    //       return GestureDetector(
    //         onTap: () {
    //           Get.to(IndividualStoryScreen());
    //         },
    //         child: AnimatedContainer(
    //           duration: const Duration(milliseconds: 300),
    //           curve: Curves.easeInOut,
    //           constraints: BoxConstraints.tight(Size.fromWidth(250)),
    //           padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
    //           height: getProportionateScreenHeight(300),
    //           width: 250,
    //           margin: EdgeInsets.symmetric(
    //               horizontal: getProportionateScreenWidth(11)),
    //           decoration: BoxDecoration(
    //             border: Border.all(
    //               color: _currentPage == mapString
    //                   ? AppTheme.whiteColor
    //                   : AppTheme.blackColor,
    //             ),
    //             color: _currentPage == mapString
    //                 ? AppTheme.storyColor
    //                 : AppTheme.whiteColor,
    //             borderRadius: BorderRadius.circular(20),
    //           ),
    //           child: Column(
    //             children: [
    //               customCentreText(
    //                   inputText: storyList[mapString].title,
    //                   fontSize: 22,
    //                   weight: FontWeight.w500,
    //                   colorName: AppTheme.blackColor),
    //               SizedBox(
    //                 height: getProportionateScreenHeight(42),
    //               ),
    //               Icon(
    //                 IconaMoon.edit,
    //                 size:
    //                     //  selectedmapString == mapString
    //                     //     ? getProportionateScreenWidth(81)
    //                     //     :
    //                     getProportionateScreenWidth(54),
    //                 color: AppTheme.iconColor,
    //               )
    //             ],
    //           ),
    //         ),
    //       );
    //     });

// class TabModel {
//   final String title;

//   TabModel({
//     required this.title,
//   });
// }

// List<TabModel> storyList = [
//   TabModel(
//     title: 'The River',
//   ),
//   TabModel(
//     title: 'The Ocean',
//   ),
//   TabModel(
//     title: 'The City',
//   ),
//   TabModel(
//     title: 'The Nile',
//   ),
//   TabModel(
//     title: 'The Bush',
//   ),
// ];
