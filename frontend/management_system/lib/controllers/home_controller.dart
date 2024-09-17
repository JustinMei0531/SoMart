import "package:get/get.dart";
import "dart:html";
import "package:management_system/services/user_service.dart";

class HomeController extends GetxController {
  RxInt currentPage = 0.obs;

  bool isFullScreen = false;

  final UserService service = Get.find<UserService>();

  void onFullScreenButtonClicked() {
    if (!isFullScreen) {
      document.documentElement?.requestFullscreen();
    } else {
      document.exitFullscreen();
    }
    isFullScreen = !isFullScreen;
    return;
  }

  void onLogoutButtonClicked() {
    // Clean User
    service.clearUserData();
    Get.offNamed("/login");
    return;
  }
}
