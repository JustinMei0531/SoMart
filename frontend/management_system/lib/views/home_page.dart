import "package:flutter/material.dart";
import "package:get/get.dart";

class HomePage extends StatelessWidget {
  final RxBool isSidebarOpened = false.obs; // State to track sidebar visibility

  HomePage({super.key});

  void onMenuButtonClicked() {
    isSidebarOpened.value =
        !isSidebarOpened.value; // Toggle the sidebar visibility
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // TopBar
          Container(
            color: Colors.white,
            // padding: const EdgeInsets.symmetric(horizontal: 16.0),
            height: 72.0,
            child: Row(
              children: [
                Obx(() {
                  return isSidebarOpened.value
                      ? Expanded(
                          flex:
                              2, // The flex value you want for the green container
                          child: Container(
                              height: 72.0,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 24.0,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Username",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text("Email",
                                            style:
                                                TextStyle(color: Colors.grey))
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        )
                      : const SizedBox(width: 0); // Hide when sidebar is closed
                }),
                Expanded(
                  flex: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        // padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        onPressed: onMenuButtonClicked,
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        "SoMart Management System",
                        style: TextStyle(
                            fontSize: 24,
                            color: Color.fromRGBO(76, 167, 113, 1.0)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
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
                          const SizedBox(
                            width: 5.0,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Body: Sidebar and Main Content
          Expanded(
            child: Obx(() => Row(
                  children: [
                    // Sidebar: This will take flex 1 or disappear when not opened
                    if (isSidebarOpened.value)
                      Expanded(
                        flex: 1, // Sidebar takes 1/5 of the space
                        child: Container(
                          color: Colors.green,
                          child: const Center(
                            child: Text(
                              "Sidebar Content",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    // Main Content: Flex 4, takes up more space
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: Text("Main Content"),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
