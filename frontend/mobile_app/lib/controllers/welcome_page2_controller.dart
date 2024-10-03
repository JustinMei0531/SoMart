import "package:get/get.dart";

class WelcomePage2Controller extends GetxController {
  void onBackButtonClicked() {
    Get.toNamed("/welcome1");
    return;
  }

  void onNextButtonClicked() {
    Get.toNamed("/welcome3");
    return;
  }
}
