import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SignUpController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
}
