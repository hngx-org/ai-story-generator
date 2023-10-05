import 'package:ai_story_generator/core/app_export.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../controller/history_controller.dart';
import 'individual_story.dart';

class FictionList extends StatefulWidget {
  const FictionList({super.key});

  @override
  State<FictionList> createState() => _FictionListState();
}

class _FictionListState extends State<FictionList> {
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
    print("------- ${_historyController.fictionsList.length}");
    return _historyController.fictionsList.isEmpty
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
            items: _historyController.fictionsList
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

