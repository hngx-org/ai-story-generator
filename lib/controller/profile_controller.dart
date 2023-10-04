import 'package:ai_story_generator/core/app_export.dart';
import 'package:ai_story_generator/core/extensions/extensions.dart';
import 'package:ai_story_generator/main.dart';
import 'package:ai_story_generator/screens/auth/sign_in.dart';
import 'package:hng_authentication/authentication.dart';

import '../core/utils/progress_dialog_utils.dart';

class ProfileController extends GetxController {
  var isDialogOpen = false.obs;
  var dialogData = "".obs;

  void openDialog(String data) {
    dialogData.value = data;
    isDialogOpen.value = true;
  }

  void closeDialog() {
    isDialogOpen.value = false;
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
