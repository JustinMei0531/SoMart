import "package:flutter/material.dart";
import "package:management_system/views/home_page.dart";
import "package:get/get.dart";
import "package:get_storage/get_storage.dart";
import "package:management_system/views/login_page.dart";
import "package:management_system/services/user_service.dart";

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "SoMart Backend Management System",
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      getPages: <GetPage<dynamic>>[
        GetPage(name: "/home", page: () => HomePage()),
        GetPage(name: "/login", page: () => LoginPage()),
      ],
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  Get.put(UserService());

  runApp(App());
}
