import 'package:ai_story_generator/core/app_export.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../controller/history_controller.dart';
import 'individual_story.dart';

class CreativeWritingList extends StatefulWidget {
  const CreativeWritingList({super.key});

  @override
  State<CreativeWritingList> createState() => _CreativeWritingListState();
}

class _CreativeWritingListState extends State<CreativeWritingList> {
  // final _controller = ScrollController();


  @override
  Widget build(BuildContext context) {
    final _historyController = Get.put(HistoryController());
    print("------- ${_historyController.creativeWritingsList.length}");
    return _historyController.creativeWritingsList.isEmpty
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
              viewportFraction: 0.7,
            ),
            items: _historyController.creativeWritingsList
                .map((mapString) => GestureDetector(
                      onTap: () {
                        Get.to(IndividualStoryScreen(title: mapString["Title"].toString(), content: mapString["Story"].toString(),));
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customCentreText(
                                inputText: mapString["Title"].toString(),
                                fontSize: 22,
                                weight: FontWeight.w500,
                                colorName: AppTheme.blackColor),
                            Image.asset(ImageConstant.creativeImage)
                          ],
                        ),
                      ),
                    ))
                .toList());
  }
}

//     return SizedBox(
//       height: getProportionateScreenHeight(300),
//       width: getProportionateScreenWidth(390),
//       child: ListView.builder(
//           controller: _controller,
//           itemCount: creativeList.length,
//           shrinkWrap: true,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             final bool isCurrentIndex = index ==
//                 (_controller.offset / MediaQuery.of(context).size.width)
//                     .round();
//             return GestureDetector(
//               onTap: () {
//                 Get.to(const IndividualStoryScreen());
//               },
//               child: Container(
//                 padding: EdgeInsets.only(
//                   top: isCurrentIndex
//                       ? getProportionateScreenHeight(42)
//                       : getProportionateScreenHeight(35),
//                   right: getProportionateScreenWidth(53),
//                   left: getProportionateScreenWidth(53),
//                   bottom: isCurrentIndex
//                       ? getProportionateScreenHeight(90)
//                       : getProportionateScreenHeight(60),
//                 ),
//                 margin: EdgeInsets.symmetric(
//                     horizontal: getProportionateScreenWidth(11)),
//                 decoration: BoxDecoration(
//                     border: Border.all(
//                       color:
//                           //  selectedIndex == index
//                           //     ? AppTheme.storyColor
//                           //     :
//                           AppTheme.blackColor,
//                     ),
//                     color: isCurrentIndex
//                         ? AppTheme.storyColor
//                         : AppTheme.whiteColor,
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Column(
//                   children: [
//                     customCentreText(
//                         inputText: creativeList[index].title,
//                         fontSize: 22,
//                         weight: FontWeight.w500,
//                         colorName: AppTheme.blackColor),
//                     SizedBox(
//                       height: getProportionateScreenHeight(42),
//                     ),
//                     Icon(
//                       IconaMoon.edit,
//                       size:
//                           //  selectedIndex == index
//                           //     ? getProportionateScreenWidth(81)
//                           //     :
//                           getProportionateScreenWidth(54),
//                       color: AppTheme.iconColor,
//                     )
//                   ],
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }

// class CreativeModel {
//   final String title;

//   CreativeModel({
//     required this.title,
//   });
// }

// List<CreativeModel> creativeList = [
//   CreativeModel(
//     title: 'The Child',
//   ),
//   CreativeModel(
//     title: 'The Man',
//   ),
//   CreativeModel(
//     title: 'The City',
//   ),
//   CreativeModel(
//     title: 'The Nile',
//   ),
//   CreativeModel(
//     title: 'The Girl',
//   ),
// ];
