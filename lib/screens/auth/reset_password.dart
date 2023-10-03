import 'package:ai_story_generator/controller/reset_password_controller.dart';
import 'package:ai_story_generator/core/app_export.dart';
import 'package:ai_story_generator/screens/auth/sign_in.dart';
import 'package:ai_story_generator/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final _resetPasswordController = Get.put(ResetPasswordController());
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
                  child: Image.asset(
                    "assets/images/logo.png",
                    scale: 4,
                  ),
                ),
              const SizedBox(
                height: 99,
              ),
              Text(
                "Forgot Password?",
                style: GoogleFonts.abhayaLibre(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Input your email to reset you password",
                textAlign: TextAlign.center,
                style: GoogleFonts.abhayaLibre(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              AuthTextField(
                textFieldController: _resetPasswordController.emailController,
                labelText: "Email",
                hintText: "username@gmail.com",
              ),
              const SizedBox(
                height: 90,
              ),
              AppButton(
                buttonText: "Reset Password",
                onPressed: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Remember password? ",
                    style: GoogleFonts.abhayaLibre(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.off(const SignInScreen());
                    },
                    child: Text(
                      "Sign In",
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
