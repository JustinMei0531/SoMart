import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:management_system/controllers/login_controller.dart";

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.of(context).size.width;
    double scHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 249, 250, 1.0),
      appBar: AppBar(
        title: const Text(
          "SoMart Management System",
          style:
              TextStyle(fontSize: 24, color: Color.fromRGBO(76, 167, 113, 1.0)),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: 72.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.nightlight,
              size: 24,
              color: Colors.grey,
            ),
          ),
          IconButton(
              onPressed: controller.onFullScreenButtonClicked,
              icon: const Icon(
                Icons.smart_screen,
                size: 24,
                color: Colors.grey,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 100.0),
              Container(
                width: MediaQuery.of(context).size.width * 0.30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      const Row(
                        children: <Widget>[
                          Text(
                            "Sign in",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.5),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      TextField(
                        controller: controller.emailController,
                        cursorWidth: 1.0,
                        cursorColor: Colors.black87,
                        obscureText: false,
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 12.0),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.black, width: 0),
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          labelText: "Email",
                          hintText: "Email",
                          hintStyle:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                          labelStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                          prefixIcon: const Icon(Icons.email,
                              color: Colors.black, size: 18),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(244, 245, 249, 1.0),
                                  width: 0),
                              borderRadius: BorderRadius.circular(2.0)),
                          floatingLabelStyle: const TextStyle(
                              color: Colors.black, fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      TextField(
                        controller: controller.pwdController,
                        obscureText: true,
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 12.0),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.black, width: 0),
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          labelText: "Password",
                          hintText: "Password",
                          hintStyle:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                          labelStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                          prefixIcon: const Icon(Icons.key,
                              color: Colors.black, size: 18),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(244, 245, 249, 1.0),
                                  width: 0.0),
                              borderRadius: BorderRadius.circular(2.0)),
                          floatingLabelStyle: const TextStyle(
                              color: Colors.black, fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          Obx(
                            () => Container(
                              padding: const EdgeInsets.all(0.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                      color: Colors.white, width: 0.0)),
                              child: Checkbox(
                                splashRadius: 0.0,
                                activeColor:
                                    const Color.fromRGBO(4, 105, 99, 1.0),
                                value: controller.isCheckBoxChecked!.value,
                                onChanged: (bool? value) {
                                  controller.isCheckBoxChecked!.value = value!;
                                },
                                semanticLabel: "Check",
                                side: const BorderSide(
                                    color: Color.fromRGBO(244, 245, 249, 1.0),
                                    width: 1.5),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Text(
                            "Remember",
                            style: TextStyle(fontSize: 12.0),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: controller.popUpAlarmDialog,
                            child: const Text(
                              "Forgot password?",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        width: double.infinity,
                        height: 40.0,
                        child: ElevatedButton(
                            onPressed: controller.onLoginButtonClicked,
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(8, 129, 120, 1.0),
                                textStyle: const TextStyle(fontSize: 12),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                )),
                            child: const Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
