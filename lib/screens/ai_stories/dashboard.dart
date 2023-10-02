import 'package:ai_story_generator/core/app_export.dart';
import 'package:ai_story_generator/screens/ai_stories/with_all_category.dart';
import 'package:ai_story_generator/screens/ai_stories/your_story.dart';
import 'package:ai_story_generator/screens/profile.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int currentPage = 0;
  List<Widget> pages = [
    YourStoryScreen(),
    UserProfileScreen(),
    WithAllCategoryScreen()
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        body: pages[currentPage],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppTheme.redColor,
            child: Icon(
              Icons.add_rounded,
              color: AppTheme.whiteColor,
              size: getProportionateScreenWidth(30),
            ),
            onPressed: () {
              setState(() {
                currentPage = 2;
              });
            }),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppTheme.whiteColor,
            currentIndex: currentPage,
            onTap: (index) {
              setState(() {
                currentPage = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              _buildBottomNavigationBarItem(
                icon: Image(image: AssetImage(ImageConstant.books)),
                title: 'Your Story',
                activeIcon: Image(image: AssetImage(ImageConstant.books)),
              ),
              _buildBottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_2_rounded,
                    size: getProportionateScreenWidth(40),
                  ),
                  title: 'Profile',
                  activeIcon: Icon(
                    Icons.person,
                    size: getProportionateScreenWidth(28),
                  )),
            ]));
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
