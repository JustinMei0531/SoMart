import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:mobile_app/constant/constant.dart";

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final currentTabIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentTabIndex.value,
            onTap: (value) => currentTabIndex.value = value,
            iconSize: 28.0,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined), label: "Order"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline), label: "Favorite"),
              BottomNavigationBarItem(icon: Icon(Icons.trolley), label: "Cart"),
            ],
            selectedItemColor: Constant.primaryGreen,
            unselectedItemColor: Constant.iconColor,
          )),
    );
  }
}
