import "package:flutter/material.dart";
import "package:get/get.dart";

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Icons.sunny,
              size: 24,
              color: Colors.grey,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.smart_screen,
                size: 24,
                color: Colors.grey,
              )),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              size: 24,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
