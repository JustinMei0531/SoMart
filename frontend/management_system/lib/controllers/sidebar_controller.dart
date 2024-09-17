import "package:get/get.dart";

class SidebarController extends GetxController {
  // To keep track of the selected index
  var selectedIndex = 0.obs;

  // Function to change the selected index
  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
