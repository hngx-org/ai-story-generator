import 'package:ai_story_generator/core/app_export.dart';
import 'package:ai_story_generator/screens/history/individual_ai_chat.dart';
import 'package:flutter/material.dart';

class WithAllCategoryScreen extends StatefulWidget {
  const WithAllCategoryScreen({super.key});

  @override
  State<WithAllCategoryScreen> createState() => _WithAllCategoryScreenState();
}

class _WithAllCategoryScreenState extends State<WithAllCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: customNormalText(
              inputText: 'Meet With AI',
              fontSize: 32,
              weight: FontWeight.w800,
              colorName: AppTheme.blackColor),
        ),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(45),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(IndividualAiChatScreen(screenType: "Stories"));
                    },
                    child: buildContainer(
                        title: 'Stories', image: ImageConstant.storyImage),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(32),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(IndividualAiChatScreen(screenType: "Creative Writing"));
                    },
                    child: buildContainer(
                        title: 'Creative Writing',
                        isDouble: true,
                        image: ImageConstant.creativeImage),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(95),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(IndividualAiChatScreen(screenType: "Poem"));
                    },
                    child: buildContainer(title: 'Poem', image: ImageConstant.poemImage),),
                  SizedBox(
                    height: getProportionateScreenHeight(32),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(IndividualAiChatScreen(screenType: "Stories"));
                    },
                    child: buildContainer(
                        title: 'Stories', image: ImageConstant.storyImage),
                  ),
                ],
              ),
            ],
          ),
        )

        // SafeArea(
        //     child: Container(
        //   margin: EdgeInsets.only(top: getProportionateScreenHeight(50)),
        //   padding:
        //       EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
        //   child: MasonryGridView.builder(
        //     itemCount: aiTab.length,
        //     gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 2),
        //     mainAxisSpacing: getProportionateScreenHeight(30),
        //     crossAxisSpacing: getProportionateScreenWidth(23),
        //     itemBuilder: (context, index) {
        //       return Container(
        //         padding: EdgeInsets.only(
        //             left: getProportionateScreenWidth(14),
        //             right: getProportionateScreenWidth(14),
        //             top: getProportionateScreenHeight(63),
        //             bottom: getProportionateScreenHeight(5)),
        //         decoration: BoxDecoration(
        //           color: Color(0xFFFCF8FF),
        //           borderRadius: BorderRadius.circular(20),
        //         ),
        //         child: Column(
        //           children: [
        //             customCentreText(
        //                 inputText: aiTab[index].title,
        //                 fontSize: 24,
        //                 weight: FontWeight.w500,
        //                 colorName: AppTheme.blackColor),
        //             SizedBox(
        //               height: getProportionateScreenHeight(15),
        //             ),
        //             Image(image: AssetImage(aiTab[index].image))
        //           ],
        //         ),
        //       );
        //     },
        //   ),
        // )),
        );
  }

  Container buildContainer(
      {bool? isDouble, required String title, required String image}) {
    return Container(
      height: getProportionateScreenHeight(250),
      width: getProportionateScreenWidth(160),
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(14),
          right: getProportionateScreenWidth(14),
          top: isDouble ?? false
              ? getProportionateScreenHeight(25)
              : getProportionateScreenHeight(50),
          bottom: getProportionateScreenHeight(5)),
      decoration: BoxDecoration(
        color: Color(0xFFFCF8FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          children: [
            customCentreText(
                inputText: title,
                fontSize: 24,
                weight: FontWeight.w500,
                colorName: AppTheme.blackColor),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            Image(image: AssetImage(image))
          ],
        ),
      ),
    );
  }
}

class AiTabModel {
  final String title;
  final String image;

  AiTabModel({required this.title, required this.image});
}

List<AiTabModel> aiTab = [
  AiTabModel(title: 'Stories', image: ImageConstant.storyImage),
  AiTabModel(title: 'Poems', image: ImageConstant.poemImage),
  AiTabModel(title: 'Creative writing', image: ImageConstant.creativeImage),
  AiTabModel(title: 'Stories', image: ImageConstant.storyImage),
];
