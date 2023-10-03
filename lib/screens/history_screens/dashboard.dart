import 'package:ai_story_generator/core/app_export.dart';
import 'package:ai_story_generator/screens/history_screens/your_story.dart';
import 'package:ai_story_generator/screens/profile.dart';
import 'package:flutter/material.dart';
import '../ai_screens/meet_with_ai_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int currentPage = 0;
  List<Widget> pages = const [
    YourStoryScreen(),
    WithAllCategoryScreen(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        backgroundColor: AppTheme.whiteColor,
        body: SafeArea(
            child: Stack(
          children: [
            pages[currentPage],
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: buildBottomNav(currentPage)),
          ],
        )));
  }

  Container buildBottomNav(int index) {
    return Container(
      color: AppTheme.whiteColor,
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(24),
          vertical: getProportionateScreenHeight(2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: getProportionateScreenWidth(85),
            height: getProportionateScreenHeight(80),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentPage = 0;
                });
              },
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(49),
                    width: getProportionateScreenWidth(73),
                    child: Image.asset(ImageConstant.books),
                  ),
                  customCentreText(
                      inputText: 'Your Stories',
                      fontSize: 16,
                      weight: FontWeight.w500,
                      colorName: AppTheme.blackColor),
                  Container(
                    height: getProportionateScreenHeight(2),
                    width: getProportionateScreenWidth(32),
                    color: index == 0
                        ? AppTheme.primaryColor
                        : AppTheme.whiteColor,
                  )
                ],
              ),
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(75),
                width: getProportionateScreenWidth(75),
              ),
              Positioned(
                bottom: getProportionateScreenHeight(40),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      currentPage = 1;
                    });
                  },
                  child: Container(
                    height: getProportionateScreenHeight(75),
                    width: getProportionateScreenWidth(75),
                    decoration: BoxDecoration(
                        color: AppTheme.redColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Icon(
                      Icons.add_rounded,
                      color: AppTheme.whiteColor,
                      size: getProportionateScreenWidth(30),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: getProportionateScreenWidth(85),
            height: getProportionateScreenHeight(80),
            child: InkWell(
              onTap: () {
                setState(() {
                  currentPage = 2;
                  //  localStorage.write("isLoggedIn", false);
                });
              },
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(49),
                    width: getProportionateScreenWidth(73),
                    child: Image.asset(
                      ImageConstant.profileAvatar,
                      scale: 4,
                    ),
                  ),
                  customCentreText(
                      inputText: 'Profile',
                      fontSize: 16,
                      weight: FontWeight.w500,
                      colorName: AppTheme.blackColor),
                  Container(
                    height: getProportionateScreenHeight(2),
                    width: getProportionateScreenWidth(32),
                    color: index == 2
                        ? AppTheme.primaryColor
                        : AppTheme.whiteColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

BottomNavigationBarItem _buildBottomNavigationBarItem({
  required Widget icon,
  required String title,
  required Widget activeIcon,
}) {
  return BottomNavigationBarItem(
    activeIcon: activeIcon,
    icon: icon,
    label: title,
  );
}
