import 'package:ai_story_generator/core/app_export.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../controller/history_controller.dart';
import 'individual_story.dart';

class PoemList extends StatefulWidget {
  const PoemList({super.key});

  @override
  State<PoemList> createState() => _PoemListState();
}

class _PoemListState extends State<PoemList> {
  final _controller = ScrollController();
 

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
       final _historyController = Get.put(HistoryController());
    print("------- ${_historyController.poemsList.length}");
    return _historyController.poemsList.isEmpty
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
            items: _historyController.poemsList
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
                            Image.asset(ImageConstant.poemImage)
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
//           itemCount: poemList.length,
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
//                         inputText: poemList[index].title,
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

// class PoemTabModel {
//   final String title;

//   PoemTabModel({
//     required this.title,
//   });
// }

// List<PoemTabModel> poemList = [
//   PoemTabModel(
//     title: 'The Uncut',
//   ),
//   PoemTabModel(
//     title: 'The Lovely',
//   ),
//   PoemTabModel(
//     title: 'The Wicked',
//   ),
//   PoemTabModel(
//     title: 'The Ocean',
//   ),
//   PoemTabModel(
//     title: 'The Only',
//   ),
// ];
