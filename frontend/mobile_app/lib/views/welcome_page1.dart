import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:mobile_app/constant/constant.dart";
import "package:mobile_app/controllers/welcome_page1_controller.dart";

class WelcomePage1 extends StatelessWidget {
  WelcomePage1({super.key});

  final WelcomePage1Controller welcomePage1Controller =
      Get.put(WelcomePage1Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 88.0,
            ),
            Center(
              child: Image.asset("./assets/images/step1.png"),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Center(
              child: Text(
                "Shop everying",
                style: TextStyle(
                  fontSize: 36.0,
                  color: Constant.primaryBlack,
                  letterSpacing: 1.0,
                  shadows: <Shadow>[
                    Shadow(
                      offset: const Offset(
                          2.0, 2.0), // position of the shadow (x, y)
                      blurRadius: 3.0, // blurriness of the shadow
                      color: Colors.grey
                          .withOpacity(0.5), // shadow color with transparency
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Center(
              child: Text(
                "Just on tap",
                style: TextStyle(
                  fontSize: 36.0,
                  color: Constant.primaryBlack,
                  letterSpacing: 1.0,
                  shadows: <Shadow>[
                    Shadow(
                      offset: const Offset(
                          2.0, 2.0), // position of the shadow (x, y)
                      blurRadius: 3.0, // blurriness of the shadow
                      color: Colors.grey
                          .withOpacity(0.5), // shadow color with transparency
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Center(
              child: Text(
                "A modern shopping system to make it \n easier for you",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Constant.secondaryGrey,
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(
              height: 64.0,
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: welcomePage1Controller.onNextButtonClicked,
                child: const Text(
                  "Next",
                  style:
                      TextStyle(color: Constant.primaryWhite, fontSize: 14.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
