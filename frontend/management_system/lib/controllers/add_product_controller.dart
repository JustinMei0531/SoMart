import "dart:convert";
import "dart:typed_data";
import "package:flutter/cupertino.dart";
import "package:get/get.dart";
import "package:image_picker/image_picker.dart";
import "package:management_system/http/apis.dart";
import "package:management_system/http/http_service.dart";
import "package:management_system/services/user_service.dart";
import "package:management_system/widgets/image_preview_box.dart";

class ImageData{
  final Uint8List bytes;

  final String name;

  ImageData({required this.bytes, required this.name});
}

class AddProductController extends GetxController {
  // Http service
  final HttpService httpService = HttpService();
  final RxBool isLoading = false.obs;

  // User service
  final UserService userService = Get.find<UserService>();

  // Category list
  final RxList categoryList = RxList<dynamic>();

  // Product image info
  final Rxn<Uint8List> selectedImage = Rxn<Uint8List>();
  final RxString imageInfo = "No image selected".obs;
  final RxList<ImageData> selectedImages = RxList<ImageData>();

  // All text input controller

  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController regularPriceController = TextEditingController();
  final TextEditingController discountPriceController = TextEditingController();
  final TextEditingController idController = TextEditingController();

  // valid product id indicator
  final RxBool isValidID = false.obs;
  final RxString idHintText = "Invalid ID".obs;

  // Load product category from backend server
  @override
  void onInit() {
    super.onInit();
    fetchCategory();
  }

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

      Get.snackbar('Error', 'Failed to load categories',
          maxWidth: 400, duration: const Duration(milliseconds: 1500));
    } finally {
      isLoading.value = false;
    }
    return;
  }

  // Select product image from dick
  Future<void> pickImages() async {
    try{
      final ImagePicker picker = ImagePicker();
      var pickedFiles = await picker.pickMultiImage(
        maxWidth: 1920,
        maxHeight: 1080,
        limit: 10
      );

      if (pickedFiles != null && pickedFiles.isNotEmpty){
        selectedImages.clear();
        selectedImages.value = await Future.wait(pickedFiles.map((file) async {
          return ImageData(
            bytes: await file.readAsBytes(), // Read image as bytes
            name: file.name, // Get the file name
          );
        }).toList());
        if (selectedImages.length > 8){
          Get.snackbar("Error", "Too many images selected", maxWidth: 400, duration: const Duration(milliseconds: 1500));
          selectedImages.clear();
          return;
        }

        // Update text indicator
        int length = selectedImages.length;
        imageInfo.value = "$length images selected";
        
        Get.snackbar("Success", "Images picked successfully!", maxWidth: 400, duration: const Duration(milliseconds: 1500));
      }

    }
    catch (e){
      Get.snackbar("Error", "Failed to pick images: $e",
          maxWidth: 400, duration: const Duration(milliseconds: 1500));
    }
  }



  // Test product id
  void onTestIDButtonClicked() async {
    if (isLoading.value == true || idController.text.isEmpty){
      return;
    }
    try{
      isLoading.value = true;
      var response = await httpService.postRequest(
        URL: ProductApis.testProductID,
        body: {
          "id": idController.text,
        },
        token: userService.token.value!
      );

      if (response.statusCode == 200){
        isValidID.value = true;
        idHintText.value = "valid ID";
      }

    }
    catch (e){
      Get.snackbar("Error", "Failed to check product ID validation", maxWidth: 400, duration: const Duration(milliseconds: 1500));
    }
    finally{
      isLoading.value = false;
    }
    return;
  }


  void onAllocateIDButtonClicked() async{
    if (isLoading.value == true){
      return;
    }
    try{
      var response = await httpService.getRequest(
        URL: ProductApis.allocateID,
        token: userService.token.value!
      );

      var data = jsonDecode(response.body);

      if (response.statusCode == 200){
        idController.value = TextEditingValue(
          text: data["id"].toString(),
        );
        isValidID.value = true;
        idHintText.value = "Valid ID";
      }
    }
    catch (e){
      Get.snackbar("Error", "Failed to check product ID validation", maxWidth: 400, duration: const Duration(milliseconds: 1500));
    }
    finally{
      isLoading.value = false;
    }
    return;
  }

  // Delete one image from item list
  void onDeleteSelectedImage(int index){
    selectedImages.removeAt(index);
    if (selectedImages.isEmpty){
      imageInfo.value = "No image selected";
    }
    else{
      int length = selectedImages.length;
      imageInfo.value = "$length images selected";
    }
    return;
  }

  // Display image preview
  void showImagePreview(Uint8List imageData){
    Get.dialog(
      ImagePreviewBox(imageData: imageData)
    );
    return;
  }







  void onPublishButtonClicked() async {}

  void onCleanAllButtonClicked() {}
}
