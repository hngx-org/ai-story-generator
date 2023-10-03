import 'package:ai_story_generator/core/app_export.dart';
import 'package:ai_story_generator/core/extensions/extensions.dart';
import 'package:ai_story_generator/main.dart';
import 'package:ai_story_generator/screens/history_screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hng_authentication/authentication.dart';

import '../core/utils/progress_dialog_utils.dart';

class SignUpController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;
  final formKey = GlobalKey<FormState>();

  validation() async {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        fullNameController.text.trim().isEmpty ||
        confirmPasswordController.text.trim().isEmpty) {
      errorSnackbar('Email or Password can not be empty');
    } else if (!emailController.text.emailValidation) {
      errorSnackbar('Please enter a valid email');
    } else if (passwordController.text.passwordValidation) {
      errorSnackbar("Please enter a strong password");
    } else if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      errorSnackbar('password mismatch');
    } else {
      signUp();
    }
  }

  void signUp() async {
    ProgressDialogUtils.showProgressDialog();
    final authRepository = Authentication();
    final result = await authRepository.signUp(emailController.text.trim(),
        fullNameController.text.trim(), passwordController.text.trim());
    print("--------- $result");
    ProgressDialogUtils.hideProgressDialog();
    if (result != null) {
      // Registration failed, display an error message

      //  if (result == "User Created Succesfully") {
        localStorage.write("isLoggedIn", true);
        Get.off(const DashBoardScreen());
        successSnackbar('SignUp successful');
      // } else {
      //   errorSnackbar("Something went wrong, please try again");
      // }
    } else {
      print('errror:   eeeeeee');
      ProgressDialogUtils.hideProgressDialog();
      errorSnackbar('SignUp ERROR');
    }
  }
}
