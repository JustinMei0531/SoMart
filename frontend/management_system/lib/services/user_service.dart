import "package:get/get.dart";
import "package:get_storage/get_storage.dart";
import "package:management_system/http/apis.dart";
import "package:management_system/http/http_service.dart";
import "package:management_system/widgets/token_dialog.dart";

class UserService extends GetxService {
  final GetStorage storage = GetStorage();

  final String tokenKey = "token";
  final String userInfoKey = "userInfo";

  RxnString token = RxnString(); // Store the token
  Rxn<Map<String, dynamic>> userInfo =
      Rxn<Map<String, dynamic>>(); // Store user info

  // Http service
  final HttpService httpService = HttpService();
  RxBool isLoading = false.obs;

  // Save token to storage and memory
  void saveToken(String _token) {
    token.value = _token;
    storage.write(tokenKey, _token);
  }

  // Load token from storage to memory
  String? loadToken() {
    token.value = storage.read(tokenKey);
    return token.value;
  }

  // Save user info to storage and memory
  void saveUserInfo(Map<String, dynamic> _userInfo) {
    userInfo.value = _userInfo;
    storage.write(userInfoKey, _userInfo);
  }

  // Load user info from storage to memory
  Map<String, dynamic>? loadUserInfo() {
    userInfo.value = storage.read(userInfoKey);
    return userInfo.value;
  }

  // Check if token exists
  bool hasToken() {
    return token.value != null;
  }

  // Check if user info exists
  bool hasUserInfo() {
    return userInfo.value != null;
  }

  // Clear user data for logout
  void clearUserData() {
    storage.remove(tokenKey);
    storage.remove(userInfoKey);
    token.value = null;
    userInfo.value = null;
  }

  Future<void> checkTokenValidity() async {
    if (token.value == null || isLoading.value == true) return;

    try {
      isLoading.value = true;
      var response = await httpService.getRequest(
          URL: Apis.verifyToken, token: token.value!);
      if (response.statusCode != 200) {
        Get.dialog(
          const TokenDialog(),
          barrierDismissible: false, // User must click the button to dismiss
        );
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void startTokenCheck() {
    interval(token, (_) {
      // Token has changed or interval reached, check validity
      checkTokenValidity();
    }, time: const Duration(minutes: 1)); // Runs every 5 minutes
  }

  @override
  void onInit() {
    // Load token and user info when service initializes
    super.onInit();
    loadToken();
    loadUserInfo();
    startTokenCheck();

  }

  @override
  void onClose() {
    super.onClose();
  }
}
