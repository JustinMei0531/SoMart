import "package:flutter/material.dart";
import "package:get/get.dart";

class TokenDialog extends StatelessWidget {
  const TokenDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the dialog compact
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              size: 50,
              color: Colors.orangeAccent,
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Session Expired",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              "Your session has expired. Please log in again.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed("/login"); // Navigate back to login page
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00796B), // Teal color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 12.0,
                ),
              ),
              child: const Text(
                "Back to Login",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
