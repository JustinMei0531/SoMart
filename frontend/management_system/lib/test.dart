import "package:get/get.dart";
import "package:flutter/material.dart";

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:management_system/http/apis.dart";
import "package:management_system/widgets/product_item.dart";

class TopBar extends StatelessWidget {
  final RxBool isOpened = false.obs; // State to control the green container

  // Method to toggle the green container visibility
  void onMenuButtonClicked() {
    isOpened.value = !isOpened.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 72.0, // Set a fixed height for the top bar
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Green container that toggles visibility
              Obx(() => AnimatedContainer(
                    width: isOpened.value ? 200.0 : 0.0,
                    height: 50.0,
                    duration: const Duration(milliseconds: 300),
                    color: Colors.green,
                    margin: const EdgeInsets.only(right: 10.0),
                  )),
              IconButton(
                onPressed: onMenuButtonClicked,
                icon: const Icon(Icons.menu),
              ),
            ],
          ),
          // Place for other top bar elements (e.g., title, search bar)
          const Text(
            "TopBar",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBar(), // Use the custom TopBar widget
          Expanded(
            child: Center(
              child: InkWell(
                onTap: () {},
                child: ProductItem(
                  imgSrc: ProductApis.imagePath + "2b195dae51fb1fd386410859adc9ee23.webp",
                  productName: "Fresh Lemon",
                  beforePrice: "12.0",
                  currentPrice: "13.0",
                  categoty: "fruit&vegetables",
                  tag: "fruit",

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(home: HomePage()));
}
