import "dart:typed_data";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:management_system/controllers/account_controller.dart";
import "package:management_system/services/user_service.dart";
import "package:management_system/utils/image_utils.dart";

class AccountSettingsPage extends StatelessWidget {
  AccountSettingsPage({super.key});

  // User service
  final UserService service = Get.find<UserService>();
  // Page controller
  final AccountController controller = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    Uint8List avatarData = ImageUtils.decodeImage(
        ImageUtils.extractBase64FromDataUrl(service.userInfo.value!["avatar"]));

    return Theme(
      data: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
            .copyWith(surface: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                const Row(
                  children: <Widget>[
                    Text(
                      "Profile setting",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          letterSpacing: 1.5),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 8.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Flex(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            double width = constraints.maxWidth * 0.60;
                            return Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Obx(
                                  () => CircleAvatar(
                                    backgroundColor: const Color.fromRGBO(
                                        244, 245, 249, 1.0),
                                    minRadius: 30,
                                    maxRadius: width / 2,
                                    backgroundImage: MemoryImage(
                                        controller.selectedImage.value ??
                                            avatarData),
                                    child: ClipOval(
                                      child: Material(
                                        color: Colors
                                            .transparent, // Transparent color to make the InkWell blend in
                                        child: InkWell(
                                          onTap: controller.onAvatarClicked,
                                          splashColor: Colors.blue.withAlpha(
                                              30), // Optional splash effect
                                          child: const SizedBox(
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30.0,
                                ),
                                OutlinedButton.icon(
                                  onPressed:
                                      controller.onUploadAvatarButtonclicked,
                                  label: const Text(
                                    "Upload",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 12.0),
                                  ),
                                  icon: const Icon(
                                    Icons.upload,
                                    size: 20.0,
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    side: const BorderSide(
                                        color: Color.fromRGBO(4, 105, 99, 1.0)),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "First name",
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextField(
                                controller: controller.firstNameController,
                                cursorWidth: 1.0,
                                cursorColor: Colors.black87,
                                obscureText: false,
                                style: const TextStyle(
                                    color: Colors.black87, fontSize: 12.0),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 0),
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                  hintText: "Your first name",
                                  hintStyle: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                  labelStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                  // prefixIcon: const Icon(Icons.email,
                                  //     color: Colors.black, size: 18),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromRGBO(
                                              244, 245, 249, 1.0),
                                          width: 0),
                                      borderRadius: BorderRadius.circular(2.0)),
                                  floatingLabelStyle: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Last name",
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextField(
                                controller: controller.lastNameController,
                                cursorWidth: 1.0,
                                cursorColor: Colors.black87,
                                obscureText: false,
                                style: const TextStyle(
                                    color: Colors.black87, fontSize: 12.0),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 0),
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                  hintText: "Your last name",
                                  hintStyle: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                  labelStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                  // prefixIcon: const Icon(Icons.email,
                                  //     color: Colors.black, size: 18),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromRGBO(
                                              244, 245, 249, 1.0),
                                          width: 0),
                                      borderRadius: BorderRadius.circular(2.0)),
                                  floatingLabelStyle: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Email",
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextField(
                                controller: controller.emailController,
                                cursorWidth: 1.0,
                                cursorColor: Colors.black87,
                                obscureText: false,
                                style: const TextStyle(
                                    color: Colors.black87, fontSize: 12.0),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 0),
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                  hintText: "Your email",
                                  hintStyle: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                  labelStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                  // prefixIcon: const Icon(Icons.email,
                                  //     color: Colors.black, size: 18),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromRGBO(
                                              244, 245, 249, 1.0),
                                          width: 0),
                                      borderRadius: BorderRadius.circular(2.0)),
                                  floatingLabelStyle: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Phone",
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextField(
                                controller: controller.phoneController,
                                cursorWidth: 1.0,
                                cursorColor: Colors.black87,
                                obscureText: false,
                                style: const TextStyle(
                                    color: Colors.black87, fontSize: 12.0),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 0),
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                  hintText: "Your mobile number",
                                  hintStyle: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                  labelStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                  // prefixIcon: const Icon(Icons.email,
                                  //     color: Colors.black, size: 18),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromRGBO(
                                              244, 245, 249, 1.0),
                                          width: 0),
                                      borderRadius: BorderRadius.circular(2.0)),
                                  floatingLabelStyle: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),

                              // Use LayoutBuilder widget to get the size of parent widget
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  double width = constraints.maxWidth;

                                  return SizedBox(
                                      width: width / 2,
                                      height: 40.0,
                                      child: ElevatedButton(
                                        onPressed: controller
                                            .onSaveChangesButtonClicked,
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    4, 105, 99, 1.0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        5.0))),
                                        child: const Text(
                                          "Save changes",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.0),
                                        ),
                                      ));
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
