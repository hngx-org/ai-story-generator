import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hng_authentication/authentication.dart';

import '../core/extensions/extensions.dart';
import '../core/utils/progress_dialog_utils.dart';
import '../main.dart';
import '../screens/history_screens/dashboard.dart';

class SignInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isObscure = true;
  final formKey = GlobalKey<FormState>();

  validation() async {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      errorSnackbar('Email or Password can not be empty');
    }else {
      signIn();
    }
  }

  void signIn() async {
    ProgressDialogUtils.showProgressDialog();
    final authRepository = Authentication();
    final result = await authRepository.signIn(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
    print("--------- $result");
    ProgressDialogUtils.hideProgressDialog();
    if (result != null) {
      // Registration failed, display an error message

      if (result["error"] == "Forbbiden") {
        errorSnackbar(result["message"]);
      } else if (result["message"] == "User Created Succesfully") {
        print('sign up result: >>> ${result["data"]}');
        localStorage.write("fullname", result["data"]["name"]);
        localStorage.write("email", result["data"]["email"]);
        localStorage.write("isLoggedIn", true);
        Get.off(const DashBoardScreen());
        successSnackbar('SignUp successful');
      } else {
        errorSnackbar("Something went wrong, please try again");
      }
    } else {
      print('errror:   eeeeeee');
      ProgressDialogUtils.hideProgressDialog();
      errorSnackbar('SignUp ERROR');
    }
  }
}
