import "dart:convert";
import "dart:typed_data";
import "package:get/get.dart";
import "package:file_picker/file_picker.dart";
import "package:management_system/http/apis.dart";
import "package:management_system/http/http_service.dart";
import "package:management_system/utils/image_utils.dart";
import "package:management_system/services/user_service.dart";
import "package:flutter/material.dart";

class AccountController extends GetxController {
  // Store image as Uint8List type
  final Rx<Uint8List?> selectedImage = Rx<Uint8List?>(null);
  final RxString imageBase64 = "".obs;

  // http service
  final HttpService httpService = HttpService();
  final RxBool isLoading = false.obs;

  // User service
  final UserService userService = Get.find<UserService>();

  // Text field controllers

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void onAvatarClicked() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );
    if (result == null) {
      return;
    }
    Uint8List? fileBytes = result.files.first.bytes;
    if (fileBytes != null) {
      selectedImage.value = fileBytes;
      imageBase64.value = ImageUtils.encodeImage(fileBytes);
    }
    return;
  }

  void onUploadAvatarButtonclicked() async {
    if (isLoading.value == true || selectedImage.value == null) {
      return;
    }

    // Get token
    String? userToken = userService.token.value;

    try {
      isLoading.value = true;
      var response = await httpService.putRequest(
          URL: Apis.updateAvatar,
          body: {
            "avatar_base64": imageBase64.value,
          },
          token: userToken!);
      var data = jsonDecode(response.body);
      String msg = data["message"];
      // Update avatar successfully
      if (response.statusCode == 200) {
        Get.snackbar("Success", msg,
            maxWidth: 400.0, duration: const Duration(seconds: 2));
      } else {
        Get.snackbar("Error", msg,
            maxWidth: 400.0, duration: const Duration(seconds: 2));
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to upload your new avatar, try again later",
          maxWidth: 350.0, duration: const Duration(seconds: 2));
    } finally {
      isLoading.value = false;
    }
  }

  void onSaveChangesButtonClicked() async {
    if (isLoading.value == true) {
      return;
    }
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty) {
      Get.snackbar("Warning", "Please verify your personal information.",
          maxWidth: 400.0, duration: const Duration(milliseconds: 1500));
      return;
    }

    if (!GetUtils.isEmail(emailController.text)) {
      Get.snackbar("Warning", "Please input a valid email.",
          maxWidth: 400.0, duration: const Duration(milliseconds: 1500));
      return;
    }
    if (!GetUtils.isPhoneNumber(phoneController.text)) {
      Get.snackbar("Warning", "Please input a valid mobile number.",
          maxWidth: 400.0, duration: const Duration(milliseconds: 1500));
      return;
    }

    try {
      isLoading.value = true;
      var response = await httpService.putRequest(
          URL: Apis.updateProfile,
          body: {
            "first_name": firstNameController.text.trim(),
            "last_name": lastNameController.text.trim(),
            "email": emailController.text.trim(),
            "phone": phoneController.text.trim(),
          },
          token: userService.token.value!);
      Map<String, dynamic> data = jsonDecode(response.body);
      String msg = data["message"];
      if (response.statusCode == 200) {
        // Update token
        userService.token.value = data["token"];
        Get.snackbar("Success", msg,
            maxWidth: 400.0, duration: const Duration(milliseconds: 1500));
      } else {
        Get.snackbar("Failed", msg,
            maxWidth: 400.0, duration: const Duration(milliseconds: 1500));
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to update your profile, try again later",
          maxWidth: 400.0, duration: const Duration(milliseconds: 1500));
    } finally {
      isLoading.value = false;
    }
  }
}
