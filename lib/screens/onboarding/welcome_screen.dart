import 'package:ai_story_generator/screens/auth/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/app_export.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: getProportionateScreenHeight(62)),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              child: SvgPicture.asset(
                ImageSvgConstant.welcomeImage,
              ),
            ),
            Expanded(
              child: Container(
                height: getProportionateScreenHeight(390),
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  color: AppTheme.welcomeBgColor,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(30),
                  vertical: getProportionateScreenHeight(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    customCentreText(
                        inputText: 'Welcome to',
                        fontSize: 30,
                        weight: FontWeight.bold,
                        colorName: AppTheme.welcomeTextColor),
                    Text(
                      "Ai Story Generator",
                      style: GoogleFonts.abrilFatface(
                        textStyle: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 207, 61, 61),
                        ),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Text(
                      "Let’s Create Stories together using the\npower of  artificial intelligence",
                      style: GoogleFonts.abhayaLibre(
                        textStyle: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.welcomeTextColor,
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: getProportionateScreenWidth(200),
                      height: 50,
                      child: AppButton(
                        onPressed: () {
                          Get.off(const SignInScreen());
                        },
                        buttonText: 'Get Started',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
