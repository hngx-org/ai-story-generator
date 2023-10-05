import 'package:ai_story_generator/controller/profile_controller.dart';
import 'package:ai_story_generator/core/app_export.dart';
import 'package:ai_story_generator/main.dart';
import 'package:ai_story_generator/screens/payments/plan_categories.dart';
import 'package:ai_story_generator/widgets/dialog_widget.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _profileController = Get.put(ProfileController());
    double wt = MediaQuery.sizeOf(context).width;
    final String fullName = localStorage.read('fullName');
    final String email = localStorage.read('email');
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              Container(
                height: getProportionateScreenHeight(423),
                width: wt,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(ImageConstant.profileImage),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  // height: getProportionateScreenHeight(423),
                  width: wt,
                  decoration: const BoxDecoration(
                    color: AppTheme.primaryColor,
                    // image: DecorationImage(
                    //   fit: BoxFit.cover,
                    //   image: AssetImage(ImageConstant.profileImage),
                    // ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: getProportionateScreenHeight(380),
            width: wt,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: getProportionateScreenHeight(34),
                left: getProportionateScreenWidth(37),
              ),
              height: getProportionateScreenHeight(458),
              decoration: const BoxDecoration(
                color: AppTheme.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customNormalText(
                            inputText: fullName,
                            fontSize: 24,
                            weight: FontWeight.w500,
                            colorName: AppTheme.blackColor,
                          ),
                          const SizedBox(
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
                                colorName: const Color(0x6E000000),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          showMyDialog(
                            context,
                            () {
                              _profileController.logOut();
                            },
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(180 / 360),
                            child: Icon(
                              Icons.logout_rounded,
                              size: 28,
                              color: AppTheme.textRedColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              AppTheme.primaryColor,
                            ),
                            elevation: MaterialStateProperty.all<double>(0),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Get.to(const PlansScreen());
                          },
                          child: customNormalText(
                            inputText: "Get a plan",
                            fontSize: 20,
                            weight: FontWeight.w800,
                            colorName: AppTheme.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
