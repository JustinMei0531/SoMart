import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_system/controllers/sidebar_controller.dart';

class Sidebar extends StatelessWidget {
  Sidebar({super.key});

  final List<Map<String, dynamic>> menuItems = [
    {"title": "Dashboard", "icon": Icons.dashboard},
    {"title": "Products", "icon": Icons.shopping_bag},
    {"title": "Orders", "icon": Icons.trolley},
    {"title": "Brands", "icon": Icons.star},
    {"title": "Add product", "icon": Icons.add},
    {"title": "Transactions", "icon": Icons.money},
    {"title": "Reviews", "icon": Icons.chat},
    {"title": "Account", "icon": Icons.account_box}
  ];

  // SidebarController to manage active state
  final SidebarController sidebarController = Get.put(SidebarController());

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
            .copyWith(surface: Colors.white),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
        color: Colors.white,
        child: ListView.builder(
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            return Container(
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                height: 45.0,
                width: double.infinity,
                child: Obx(
                  () => TextButton(
                    onPressed: () {
                      // Update the selected index in the SidebarController
                      sidebarController.changeIndex(index);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor:
                          sidebarController.selectedIndex.value == index
                              ? const Color.fromRGBO(206, 230, 228, 1.0)
                              : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        // Use Obx to update the icon independently
                        Obx(() => Icon(
                              menuItems[index]["icon"],
                              color: sidebarController.selectedIndex.value ==
                                      index
                                  ? const Color.fromRGBO(
                                      8, 129, 120, 1.0) // Selected icon color
                                  : Colors.grey, // Default color
                            )),
                        const SizedBox(width: 10.0),
                        // Use Obx to update the text color independently
                        Text(
                          menuItems[index]["title"],
                          style: const TextStyle(
                              fontSize: 12.0, color: Colors.black87),
                        )
                      ],
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
