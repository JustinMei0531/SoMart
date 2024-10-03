import "dart:typed_data";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:management_system/controllers/sidebar_controller.dart";
import "package:management_system/services/user_service.dart";
import "package:management_system/controllers/home_controller.dart";
import "package:management_system/views/account_settings_page.dart";
import "package:management_system/views/add_product_page.dart";
import "package:management_system/views/all_users_page.dart";
import "package:management_system/views/brands_page.dart";
import "package:management_system/views/dashboard_page.dart";
import "package:management_system/views/orders_page.dart";
import "package:management_system/views/products_page.dart";
import "package:management_system/views/reviews_page.dart";
import "package:management_system/views/transactions_page.dart";
import "package:management_system/widgets/sidebar.dart";
import "package:management_system/utils/image_utils.dart";

class HomePage extends StatelessWidget {
  final RxBool isSidebarOpened = false.obs; // State to track sidebar visibility

  // User service
  final UserService service = Get.find<UserService>();
  HomePage({super.key});

  // Page controllers
  final HomeController homeController = Get.put(HomeController());
  final SidebarController sidebarController = Get.put(SidebarController());

  void onMenuButtonClicked() {
    isSidebarOpened.value =
        !isSidebarOpened.value; // Toggle the sidebar visibility
  }

  @override
  Widget build(BuildContext context) {
    //  Decode base64 image data
    Uint8List imageData = ImageUtils.decodeImage(
        ImageUtils.extractBase64FromDataUrl(service.userInfo.value!["avatar"]));
    return Scaffold(
      body: Column(
        children: [
          // TopBar
          Container(
            color: Colors.white,
            // padding: const EdgeInsets.symmetric(horizontal: 16.0),
            height: 72.0,
            child: Row(
              children: [
                Obx(() {
                  return isSidebarOpened.value
                      ? Expanded(
                          flex:
                              2, // The flex value you want for the green container
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.0,
                                      color: const Color.fromRGBO(
                                          248, 249, 250, 1.0))),
                              height: 72.0,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 24.0,
                                      backgroundImage: MemoryImage(imageData),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Wrap(
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              service.userInfo
                                                      .value?["first_name"] +
                                                  " " +
                                                  service.userInfo
                                                      .value?["last_name"],
                                              style: const TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 12.0),
                                            ),
                                            Text(
                                                service
                                                    .userInfo.value?["email"],
                                                style: const TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 12.0))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        )
                      : const SizedBox(width: 0); // Hide when sidebar is closed
                }),
                Expanded(
                  flex: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        // padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        onPressed: onMenuButtonClicked,
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.grey,
                        ),
                      ),
                      const Flexible(
                        child: Text(
                          "SoMart Management System  v1.0.0",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 24,
                              color: Color.fromRGBO(76, 167, 113, 1.0)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.sunny,
                              size: 24,
                              color: Colors.grey,
                            ),
                          ),
                          IconButton(
                              onPressed:
                                  homeController.onFullScreenButtonClicked,
                              icon: const Icon(
                                Icons.smart_screen,
                                size: 24,
                                color: Colors.grey,
                              )),
                          IconButton(
                            onPressed: homeController.onLogoutButtonClicked,
                            icon: const Icon(
                              Icons.exit_to_app,
                              size: 24,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Body: Sidebar and Main Content
          Expanded(
            child: Obx(() => Row(
                  children: [
                    // Sidebar: This will take flex 1 or disappear when not opened
                    if (isSidebarOpened.value)
                      Expanded(
                          flex: 1, // Sidebar takes 1/5 of the space
                          child: Sidebar()),
                    // Main Content: Flex 4, takes up more space
                    Expanded(
                      flex: 4,
                      child: Obx(() => Container(
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(248, 249, 250, 1.0),
                            ),
                            child: IndexedStack(
                              index: sidebarController.selectedIndex.value,
                              children: <Widget>[
                                DashboardPage(),
                                ProductsPage(),
                                OrdersPage(),
                                BrandsPage(),
                                AddProductPage(),
                                AllUsersPage(),
                                TransactionsPage(),
                                ReviewsPage(),
                                AccountSettingsPage(),
                              ],
                            ),
                          )),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
