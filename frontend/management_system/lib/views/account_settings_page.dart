import "package:flutter/material.dart";
import "package:get/get.dart";

class AccountSettingsPage extends StatelessWidget {
  AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: Container(
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
                                CircleAvatar(
                                  backgroundColor:
                                      const Color.fromRGBO(244, 245, 249, 1.0),
                                  minRadius: 30,
                                  maxRadius: width / 2,
                                ),
                                const SizedBox(
                                  height: 30.0,
                                ),
                                OutlinedButton.icon(
                                  onPressed: () {},
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
                            // mainAxisAlignment: MainAxisAlignment.start,
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
                                height: 10.0,
                              ),

                              // Use LayoutBuilder widget to get the size of parent widget
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  double width = constraints.maxWidth;

                                  return SizedBox(
                                      width: width / 2,
                                      height: 40.0,
                                      child: ElevatedButton(
                                        onPressed: () {},
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
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 300.0,
                          color: Colors.green,
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
