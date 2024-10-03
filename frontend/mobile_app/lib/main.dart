import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:get_storage/get_storage.dart";
import "package:mobile_app/constant/constant.dart";
import "package:mobile_app/views/home_page.dart";
import "package:mobile_app/views/splash_screen.dart";
import "package:mobile_app/views/welcome_page1.dart";
import "package:mobile_app/views/welcome_page2.dart";
import "package:mobile_app/views/welcome_page3.dart";

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Somart",
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      getPages: [
        GetPage(name: "/splash", page: () => const SplashScreen()),
        GetPage(name: "/welcome1", page: () => WelcomePage1()),
        GetPage(name: "/welcome2", page: () => WelcomePage2()),
        GetPage(name: "/welcome3", page: () => WelcomePage3()),
        GetPage(name: "/home", page: () => HomePage()),
      ],

      // Set APP theme
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Constant.primaryWhite,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Constant.primaryGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Constant.primaryWhite,
            overlayColor: Constant.primaryWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ),
    );
  }
}

void main() async {
  await GetStorage.init();
  runApp(const App());
}
