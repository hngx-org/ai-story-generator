import 'package:ai_story_generator/core/app_export.dart';
import 'package:ai_story_generator/main.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.sizeOf(context).width;
    final String fullName = localStorage.read('fullName');
    final String email = localStorage.read('email');
    SizeConfig.init(context);
    return Scaffold(
        backgroundColor: AppTheme.whiteColor,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: getProportionateScreenHeight(421),
              width: wt,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(ImageConstant.profileImage),
                ),
              ),
            ),
            Positioned(
                top: getProportionateScreenHeight(380),
                width: wt,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      top: getProportionateScreenHeight(34),
                      left: getProportionateScreenWidth(37)),
                  height: getProportionateScreenHeight(458),
                  decoration: BoxDecoration(
                      color: AppTheme.whiteColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customNormalText(
                          inputText: fullName,
                          fontSize: 24,
                          weight: FontWeight.w500,
                          colorName: AppTheme.blackColor),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.email_outlined,
                            size: getProportionateScreenWidth(20),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(20),
                          ),
                          customNormalText(
                              inputText: email,
                              fontSize: 16,
                              weight: FontWeight.w500,
                              colorName: Color(0x6E000000)),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
