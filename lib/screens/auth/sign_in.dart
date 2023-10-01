import 'package:ai_story_generator/controller/sign_In_controller.dart';
import 'package:ai_story_generator/core/app_export.dart';
import 'package:ai_story_generator/screens/auth/change_password.dart';
import 'package:ai_story_generator/screens/auth/reset_password.dart';
import 'package:ai_story_generator/screens/auth/sign_up.dart';
import 'package:ai_story_generator/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _signInController = Get.put(SignInController());
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Image.asset(ImageConstant.smallAppLogo),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Image.asset(ImageConstant.editIcon),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Let's sign you in.",
                style: GoogleFonts.abhayaLibre(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Sign in to enjoy an experience\npowered by ai stories ",
                textAlign: TextAlign.center,
                style: GoogleFonts.abhayaLibre(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              AuthTextField(
                textFieldController: _signInController.emailController,
                labelText: "Email",
                hintText: "username@gmail.com",
              ),
              const SizedBox(
                height: 40,
              ),
              AuthTextField(
                textFieldController: _signInController.passwordController,
                labelText: "Password",
                hintText: "Input password",
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.off(const ForgotPassword());
                  },
                  child: Text(
                    "Forgot password?",
                    style: GoogleFonts.abhayaLibre(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              AppButton(
                buttonText: "Sign In",
                onPressed: () {
                  Get.off(const ChangePassword());
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: GoogleFonts.abhayaLibre(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.off(const SignUpScreen());
                    },
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.abhayaLibre(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
