import "package:flutter/material.dart";
import "package:photo_view/photo_view.dart";
import "dart:typed_data";
import "package:get/get.dart";


class ImagePreviewBox extends StatelessWidget{

  ImagePreviewBox({required this.imageData, super.key});

  final Uint8List imageData;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog(
      backgroundColor: Colors.transparent, // Transparent dialog background
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white, // Set container background to white
              borderRadius: BorderRadius.circular(12), // Optional rounded corners
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12), // Ensure the image has rounded corners
              child: PhotoView(
                imageProvider: MemoryImage(imageData),
                backgroundDecoration: const BoxDecoration(
                  color: Colors.transparent, // Transparent background in PhotoView
                ),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 3,
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.black, size: 30),
              onPressed: () {
                Get.back(); // Close the dialog
              },
            ),
          ),
        ],
      ),
    );
  }
}