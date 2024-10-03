import "dart:html";
import "dart:convert";
import "package:crypto/crypto.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:get/get.dart";
import "package:management_system/http/apis.dart";
import "package:management_system/http/http_service.dart";
import "package:management_system/services/user_service.dart";

class LoginController extends GetxController {
  // Two textfield widgets controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

  // http service
  HttpService httpService = HttpService();
  final RxBool isLoading = false.obs;

  // Switch to full screen mode
  final RxBool isFullScreen = false.obs;

  // Remember checkbox state
  RxBool? isCheckBoxChecked = false.obs;

  // User service
  final UserService service = Get.find<UserService>();

  void onFullScreenButtonClicked() {
    if (isFullScreen.value == false) {
      isFullScreen.value = true;
      document.documentElement?.requestFullscreen();
    } else {
      isFullScreen.value = false;
      document.exitFullscreen();
    }
  }

  void popUpAlarmDialog() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        title: const Text("Warning"),
        content: const Text(
            '''You are trying to log in to the administrator account. If you forget 
your password, please contact the administrator to reset it.'''),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Closes the dialog
            },
            child: const Text(
              "Close",
              style: TextStyle(color: Color.fromRGBO(8, 129, 120, 1.0)),
            ),
          ),
        ],
      ),
    );
  }

  void onLoginButtonClicked() async {
    if (isLoading.value == true) {
      return;
    }
    // Remove white space
    String email = emailController.text.trim();
    String password = pwdController.text.trim();

    if (!GetUtils.isEmail(email)) {
      Get.snackbar("Error", "Please check your email",
          maxWidth: 350.0,
          icon: const Icon(
            Icons.warning,
            color: Colors.red,
          ));
      return;
    }
    if (password.isEmpty) {
      return;
    }

    // Encrpt the password
    String encodedPassword = md5.convert(utf8.encode(password)).toString();
    // Send network request
    try {
      isLoading.value = true;
      http.Response response = await httpService.postRequest(
          URL: Apis.login, body: {"email": email, "password": encodedPassword});
      if (response.statusCode == 200) {
        dynamic data = jsonDecode(response.body);

        // Save token and user info
        service.saveToken(data["token"]);
        service.saveUserInfo(data["user"]);

        Get.snackbar("Success", "Login successful",
            icon: const Icon(Icons.verified_outlined),
            maxWidth: 350.0,
            duration: const Duration(seconds: 2));
        Get.offNamed("/home");
      } else {
        Get.snackbar("Error", "Login Failed",
            icon: const Icon(Icons.error),
            maxWidth: 350.0,
            duration: const Duration(seconds: 2));
      }
    } catch (e) {
      Get.snackbar("Error occurred", "$e",
          icon: const Icon(Icons.error),
          maxWidth: 350.0,
          duration: const Duration(seconds: 2));
    } finally {
      isLoading.value = false;
    }
  }
}
