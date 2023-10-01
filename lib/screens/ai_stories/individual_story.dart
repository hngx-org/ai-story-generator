import 'package:ai_story_generator/core/app_export.dart';
import 'package:flutter/material.dart';

class IndividualStoryScreen extends StatelessWidget {
  const IndividualStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            size: getProportionateScreenWidth(29),
          ),
        ),
        centerTitle: true,
        title: customNormalText(
            inputText: 'The River',
            fontSize: 32,
            weight: FontWeight.w800,
            colorName: AppTheme.blackColor),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customJustifiedText(
                  inputText:
                      'Lorem ipsum dolor sit amet consectetur. Phasellus leo felis ac ut a eu. Id tincidunt scelerisque malesuada etiam elit sodales sem amet suspendisse. Tortor vitae vulputate ipsum risus dignissim adipiscing lobortis. Porttitor volutpat dolor faucibus lobortis dis orci et et. Senectus id pulvinar odio. \n\nfermentum elementum tellus ut mauris. Fringilla pellentesque lorem neque volutpat. Eu morbi dui morbi aliquam eu consequat blandit dignissim dolor. Nullam interdum sed etiam at id varius nunc. Consectetur id vitae purus. \n\nrhoncus volutpat velit ac bibendum nisi. Id ipsum amet eu sem porta auctor vestibulum. Mauris nunc enim est lorem velit velit. Justo tristique dictum euismod id eros lorem orci mauris. Aliquet in blandit nibh commodo praesent euismod a. Dolor eleifend quam tempus quispellentesque gravida. Sagittis vulputate egestas eget aliquet odio. Amet rutrum pellentesque aliquam tempus nibh. \n\nsollicitudin odio netus ac. Aenean vulputate morbi tempus gravida. Tincidunt turpis purus rutrum amet tincidunt. Ut nunc ut suspendisse nisi ut. Tellus proin rhoncus mauris a lacus. Vel viverra aliquet imperdiet eget integer netus. Commodo dignissim ultricies tellus viverra vulputate est vive tristique. Porttitor at hendrerit adipiscing phasellus facilisis vulputate. In varius cras imperdiet pretium in tellus tempus blandit imperdiet.',
                  fontSize: 16,
                  weight: FontWeight.w400,
                  colorName: AppTheme.blackColor)
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppTheme.whiteColor,
          elevation: 0,
          child: Icon(
            Icons.share_rounded,
            color: AppTheme.shareColor,
            size: getProportionateScreenWidth(31),
          ),
          onPressed: () {}),
    );
  }
}
