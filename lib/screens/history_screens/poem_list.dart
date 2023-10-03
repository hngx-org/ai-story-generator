import 'package:ai_story_generator/core/app_export.dart';
import 'package:ai_story_generator/screens/history_screens/individual_story.dart';
import 'package:flutter/material.dart';
import 'package:iconamoon/iconamoon.dart';

class PoemList extends StatefulWidget {
  const PoemList({super.key});

  @override
  State<PoemList> createState() => _PoemListState();
}

class _PoemListState extends State<PoemList> {
  final _controller = ScrollController();
  // var indice;
  // final _itemListener = ItemPositionsListener.create();
  // int selectedIndex = 0;

  // @override
  // void initState() {
  //   _itemListener.itemPositions.addListener(() {
  //     indice = _itemListener.itemPositions.value.where((item) {
  //       final isTopVisible = item.itemLeadingEdge >= 0;
  //       final isBottomVisible = item.itemTrailingEdge <= 1;

  //       return isTopVisible && isBottomVisible;
  //     }).map((item) => item.index);
  //     print(indice);
  //   });
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(300),
      width: getProportionateScreenWidth(390),
      child: ListView.builder(
          controller: _controller,
          itemCount: poemList.length,
          // itemPositionsListener: _itemListener,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final bool isCurrentIndex = index ==
                (_controller.offset / MediaQuery.of(context).size.width)
                    .round();
            return GestureDetector(
              onTap: () {
                Get.to(IndividualStoryScreen());
              },
              child: Container(
                padding: EdgeInsets.only(
                  top: isCurrentIndex
                      ? getProportionateScreenHeight(42)
                      : getProportionateScreenHeight(35),
                  right: getProportionateScreenWidth(53),
                  left: getProportionateScreenWidth(53),
                  bottom: isCurrentIndex
                      ? getProportionateScreenHeight(90)
                      : getProportionateScreenHeight(60),
                ),
                margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(11)),
                decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          //  selectedIndex == index
                          //     ? AppTheme.storyColor
                          //     :
                          AppTheme.blackColor,
                    ),
                    color: isCurrentIndex
                        ? AppTheme.storyColor
                        : AppTheme.whiteColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    customCentreText(
                        inputText: poemList[index].title,
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
            );
          }),
    );
  }
}

class PoemTabModel {
  final String title;

  PoemTabModel({
    required this.title,
  });
}

List<PoemTabModel> poemList = [
  PoemTabModel(
    title: 'The Uncut',
  ),
  PoemTabModel(
    title: 'The Lovely',
  ),
  PoemTabModel(
    title: 'The Wicked',
  ),
  PoemTabModel(
    title: 'The Ocean',
  ),
  PoemTabModel(
    title: 'The Only',
  ),
];
