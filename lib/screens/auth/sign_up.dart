import 'package:ai_story_generator/controller/signUp_controller.dart';
import 'package:ai_story_generator/core/app_export.dart';
import 'package:ai_story_generator/screens/auth/sign_in.dart';
import 'package:ai_story_generator/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _signUpController = Get.put(SignUpController());
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
              Text(
                "Create an account",
                style: GoogleFonts.abhayaLibre(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Are you new here, inout your details\nto get start your stories journey",
                textAlign: TextAlign.center,
                style: GoogleFonts.abhayaLibre(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AuthTextField(
                textFieldController: _signUpController.firstNameController,
                labelText: "First name",
                hintText: "Input your first name",
              ),
              const SizedBox(
                height: 40,
              ),
              AuthTextField(
                textFieldController: _signUpController.lastNameController,
                labelText: "Last name",
                hintText: "Input your last name",
              ),
              const SizedBox(
                height: 40,
              ),
              AuthTextField(
                textFieldController: _signUpController.emailController,
                labelText: "Email",
                hintText: "username@gmail.com",
              ),
              const SizedBox(
                height: 40,
              ),
              AuthTextField(
                textFieldController: _signUpController.passwordController,
                labelText: "Password",
                hintText: "Input password",
              ),
              const SizedBox(
                height: 40,
              ),
              AuthTextField(
                textFieldController: _signUpController.confirmPasswordController,
                labelText: "Confirm password",
                hintText: "Confirm password",
              ),
              const SizedBox(
                height: 30,
              ),
              AppButton(
                buttonText: "Sign Up",
                onPressed: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
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
