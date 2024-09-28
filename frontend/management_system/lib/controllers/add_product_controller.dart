import "package:get/get.dart";
import "package:management_system/http/http_service.dart";
import "package:management_system/services/user_service.dart";

class AddProductController extends GetxController {
  // Http service
  final HttpService httpService = HttpService();
  final RxBool isLoading = false.obs;

  // User service
  final UserService userService = Get.find<UserService>();

  // Category list
  final RxList categoryList = RxList<String>();
}
