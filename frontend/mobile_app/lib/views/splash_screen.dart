import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:mobile_app/constant/constant.dart";

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.of(context).size.width;
    double scHeight = MediaQuery.of(context).size.height;
    Future.delayed(
        const Duration(seconds: 3), () => Get.offAllNamed("/welcome1"));
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Center logo
          Positioned(
            top: scHeight / 2 - Constant.logoSize / 2,
            left: scWidth / 2 - Constant.logoSize / 2,
            child: Image.asset("./assets/images/Logo 168x168.png"),
          ),

          Positioned(
            bottom: 50.0,
            width: scWidth,
            child: const Center(
              child: Text(
                "Somart ${Constant.version}",
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
