import "package:get/get.dart";

class WelcomePage1Controller extends GetxController {
  void onNextButtonClicked() {
    Get.toNamed("/welcome2");
    return;
  }
}
