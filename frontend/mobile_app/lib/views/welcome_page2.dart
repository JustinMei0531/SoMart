import "package:flutter/material.dart";
import "package:mobile_app/constant/constant.dart";
import "package:mobile_app/controllers/welcome_page2_controller.dart";
import "package:get/get.dart";

class WelcomePage2 extends StatelessWidget {
  WelcomePage2({super.key});

  final WelcomePage2Controller welcomePage2Controller =
      Get.put(WelcomePage2Controller());

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
              child: Image.asset("./assets/images/step2.png"),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Center(
              child: Text(
                "We have",
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
                "shopping assistent",
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
                "Shop quielty without the hassle and \n queues",
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
            Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 60.0,
                      child: TextButton(
                        onPressed: welcomePage2Controller.onBackButtonClicked,
                        child: const Text(
                          "Back",
                          style: TextStyle(
                              fontSize: 14.0, color: Constant.primaryBlack),
                        ),
                      ),
                    )),
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 60.0,
                      child: ElevatedButton(
                        onPressed: welcomePage2Controller.onNextButtonClicked,
                        child: const Text(
                          "Next",
                          style: TextStyle(
                              fontSize: 14.0, color: Constant.primaryWhite),
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
