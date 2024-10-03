import "dart:convert";
import "package:flutter/cupertino.dart";
import "package:get/get.dart";
import "package:management_system/main.dart";
import "package:management_system/services/user_service.dart";
import "package:management_system/http/http_service.dart";
import "package:management_system/http/apis.dart";


class ProductsController extends GetxController{

  // Http service
  HttpService httpService = HttpService();
  RxBool isLoading = false.obs;

  // User service
  UserService userService = Get.find<UserService>();

  // Product category list
  RxList<Map<String, dynamic>> categoryList = RxList<Map<String, dynamic>>();

  // TextEditingControllers
  final TextEditingController searchProductController = TextEditingController();

  // Product list
  final RxList<dynamic> products = RxList<dynamic>();

  // Get product categories
  Future<void> fetchCategory() async {
    if (isLoading.value == true) {
      return;
    }
    try {
      isLoading.value = true;
      var response = await httpService.getRequest(
          URL: Apis.getAllCategories, token: userService.token.value!);
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        categoryList.value = data["categories"];
      }
    } catch (e) {

      Get.snackbar("Error from products page", "Failed to load categories",
          maxWidth: 400, duration: const Duration(milliseconds: 1500));
    } finally {
      isLoading.value = false;
    }
    return;
  }

  Future<void> onSearchProductButtonClicked() async{
    if (searchProductController.text.isEmpty || isLoading.value == true){
      return;
    }

    String api = ProductApis.searchProduct;
    String param = searchProductController.text;
    if (GetUtils.isAlphabetOnly(searchProductController.text)){

      api += "?name=$param";
    }
    else if (GetUtils.isNum(searchProductController.text)){
      api += "?id=$param";
    }

    try{
      isLoading.value = true;
      String text = searchProductController.text;
      // Checking searching type based on the text
      var response = await httpService.getRequest(URL: api, token: userService.token.value!);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200){
        products.value = data["products"];
        print(products);
      }
      else{
        print("error");
      }
    }
    catch (e){
      Get.snackbar("Error", "Failed to get products", maxWidth: 400, duration: const Duration(milliseconds: 1500));
    }

    finally{
      isLoading.value = false;
    }
    return;

  }


  @override
  void onInit() {
    fetchCategory();

    super.onInit();
  }

}