import 'package:ai_story_generator/core/app_export.dart';
import 'package:ai_story_generator/screens/ai_stories/your_story.dart';
import 'package:ai_story_generator/screens/history/history_with_all_category.dart';
import 'package:ai_story_generator/screens/profile.dart';
import 'package:flutter/material.dart';

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
        body: SafeArea(
            child: Stack(
      children: [
        pages[currentPage],
        Positioned(
            left: 0, right: 0, bottom: 0, child: buildBottomNav(currentPage)),
      ],
    ))

        //      Column(
        //   children: [

        //     Expanded(flex: 15, child: pages[currentPage]),
        //     Expanded(
        //       flex: 2,
        //       child: Align(
        //         alignment: FractionalOffset.bottomCenter,
        //         child: buildBottomNav(),
        //       ),
        //     )
        //   ],
        // )),

        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: FloatingActionButton(
        //     backgroundColor: AppTheme.redColor,
        //     child: Icon(
        //       Icons.add_rounded,
        //       color: AppTheme.whiteColor,
        //       size: getProportionateScreenWidth(30),
        //     ),
        //     onPressed: () {
        //       setState(() {
        //         currentPage = 2;
        //       });
        //     }),
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: AppTheme.whiteColor,
        //   currentIndex: currentPage,
        //   onTap: (index) {
        //     setState(() {
        //       currentPage = index;
        //     });
        //   },
        //   type: BottomNavigationBarType.fixed,
        //   items: [
        //     _buildBottomNavigationBarItem(
        //       icon: Image(image: AssetImage(ImageConstant.books)),
        //       title: 'Your Story',
        //       activeIcon: Image(image: AssetImage(ImageConstant.books)),
        //     ),
        //     _buildBottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.person_2_rounded,
        //           size: getProportionateScreenWidth(40),
        //         ),
        //         title: 'Profile',
        //         activeIcon: Icon(
        //           Icons.person,
        //           size: getProportionateScreenWidth(28),
        //         )),
        //   ],
        // ),
        );
  }

  Container buildBottomNav(int index) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(24),
          vertical: getProportionateScreenHeight(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            splashColor: AppTheme.primaryColor,
            onTap: () {
              setState(() {
                currentPage = 0;
              });
            },
            child: Column(
              children: [
                Image(image: AssetImage(ImageConstant.books)),
                customCentreText(
                    inputText: 'Your Stories',
                    fontSize: 16,
                    weight: FontWeight.w500,
                    colorName: AppTheme.blackColor),
                Container(
                  height: getProportionateScreenHeight(2),
                  width: getProportionateScreenWidth(32),
                  color:
                      index == 0 ? AppTheme.primaryColor : AppTheme.whiteColor,
                )
              ],
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
          InkWell(
            onTap: () {
              setState(() {
                currentPage = 2;
              });
            },
            child: Column(
              children: [
                Image(image: AssetImage(ImageConstant.profileAvatar)),
                customCentreText(
                    inputText: 'Profile',
                    fontSize: 16,
                    weight: FontWeight.w500,
                    colorName: AppTheme.blackColor),
                Container(
                  height: getProportionateScreenHeight(2),
                  width: getProportionateScreenWidth(32),
                  color:
                      index == 2 ? AppTheme.primaryColor : AppTheme.whiteColor,
                )
              ],
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
