import 'package:ai_story_generator/controller/sign_In_controller.dart';
import 'package:ai_story_generator/core/app_export.dart';
import 'package:ai_story_generator/screens/auth/reset_password.dart';
import 'package:ai_story_generator/screens/auth/sign_up.dart';
import 'package:ai_story_generator/screens/payments/plan_categories.dart';
import 'package:ai_story_generator/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _signInController = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _signInController.formKey,
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
                  height: 20,
                ),
                Center(
                  child: SvgPicture.asset(ImageSvgConstant.editIcon),
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
                  isObsure: _signInController.isObscure,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _signInController.isObscure =
                            !_signInController.isObscure;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Icon(
                        _signInController.isObscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: _signInController.isObscure
                            ? Colors.grey
                            : AppTheme.primaryColor,
                        size: 20,
                      ),
                    ),
                  ),
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
                    Get.off(const PlansScreen());
                    // Get.off(const ChangePassword());
                    // _signInController.validation();
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
      ),
    );
  }
}
