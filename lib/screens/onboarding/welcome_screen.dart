import 'package:ai_story_generator/screens/auth/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/app_export.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.whiteColor,
        body: Column(
          children: <Widget>[
            const SizedBox(height: 62.0),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              child: Image.asset(
                ImageConstant.welcomeImage2,
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 30.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Welcome to",
                      style: GoogleFonts.abrilFatface(
                        textStyle: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.welcomeTextColor,
                        ),
                      ),
                    ),
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
                    const SizedBox(height: 20.0),
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
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          Get.off(const SignInScreen());
                        },
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.whiteColor,
                          ),
                        ),
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
