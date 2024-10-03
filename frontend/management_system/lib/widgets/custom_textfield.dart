import "package:flutter/material.dart";

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;

  final String? hintText;

  final bool obscureText;

  final Widget? suffixWidget;

  CustomTextField(
      {this.controller, this.hintText, this.suffixWidget, this.obscureText = false, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorWidth: 1.0,
      cursorColor: Colors.black87,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.black87, fontSize: 12.0),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 0),
          borderRadius: BorderRadius.circular(2.0),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
        labelStyle: const TextStyle(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
        suffixIcon: suffixWidget,
        // prefixIcon: const Icon(Icons.email,
        //     color: Colors.black, size: 18),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0),
            borderRadius: BorderRadius.circular(2.0)),
        floatingLabelStyle: const TextStyle(color: Colors.black, fontSize: 18),
      ),

    );
  }
}
