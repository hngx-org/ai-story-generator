import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/app_export.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 62.0),
          SizedBox(
            height: 300.0,
            width: double.infinity,
            child: Image.asset(
              ImageConstant.welcomeImage2,
            ),
          ),
          Container(
            height: getProportionateScreenHeight(390),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              color: AppTheme.whiteColor,
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
                      color: AppTheme.textRedColor,
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
                const SizedBox(height: 90.0),
                SizedBox(
                  width: getProportionateScreenWidth(225),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 20.0,
                      ),
                    ),
                    onPressed: () {
                      // Navigate to Sign In or Sign Up screen
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
        ],
      ),
    );
  }
}
