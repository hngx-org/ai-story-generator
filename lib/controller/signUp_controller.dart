import 'package:ai_story_generator/core/app_export.dart';
import 'package:ai_story_generator/core/extensions/extensions.dart';
import 'package:ai_story_generator/main.dart';
import 'package:ai_story_generator/screens/auth/sign_in.dart';
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
    } else if (passwordController.text.length < 8) {
      errorSnackbar("Please enter a strong password of more than 8 digits");
    } else if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      errorSnackbar('password mismatch');
    } else if (fullNameController.text.contains(" ")) {
      fullNameController.text = fullNameController.text.replaceAll(" ", "_");
      print("_____ ${fullNameController.text}");
      signUp();
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
      print("--------- ${result.name}");
      print("--------- ${result.email}");
      print("--------- ${result.cookie}");
      print("--------- ${result.id}");

      localStorage.write('fullName', result.name);
      localStorage.write('email', result.email);
      localStorage.write('cookie', result.cookie);
      localStorage.write('id', result.id);
      localStorage.write("isLoggedIn", true);

      Get.off(const SignInScreen());
      successSnackbar('SignUp successful');
    } else {
      print('errror:   eeeeeee');
      ProgressDialogUtils.hideProgressDialog();
      errorSnackbar('SignUp ERROR');
    }
  }

  void logOut() async {
    // print("----- logOut");
    ProgressDialogUtils.showProgressDialog();
    final authRepository = Authentication();
    final result = await authRepository.logout(localStorage.read('email'));
    // print("=== $result");
    ProgressDialogUtils.hideProgressDialog();
    if (result["message"] == "success") {
      Get.off(const SignInScreen());
      localStorage.write("isLoggedIn", false);
    } else {
      errorSnackbar(result["message"]);
    }
  }
}
