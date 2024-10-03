import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:mobile_app/constant/constant.dart";
import "package:mobile_app/controllers/welcome_page3_controller.dart";

class WelcomePage3 extends StatelessWidget {
  WelcomePage3({super.key});

  final WelcomePage3Controller welcomePage3Controller =
      Get.put(WelcomePage3Controller());

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
              child: Image.asset("./assets/images/step3.png"),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Center(
              child: Text(
                "Easy pickup or",
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
                "delivery shopping",
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
                "There is a process for purchasing the \n items needed",
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
                onPressed: () {},
                child: const Text(
                  "Continue",
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
