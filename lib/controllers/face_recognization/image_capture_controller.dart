import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageCaptureController extends GetxController {
  var images = <XFile?>[null, null, null].obs; // List to hold three images

  // // Method to capture an image
  // Future<void> captureImage(int index) async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image = await picker.pickImage(source: ImageSource.camera);
  //   if (image != null) {
  //     images[index] = image; // Update the image at the specified index
  //   }
  // }

  // Method to capture an image
  Future<void> captureImage(int index) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      images[index] = image; // Update the image at the specified index
    }
  }

  // Method to delete an image
  void deleteImage(int index) {
    images[index] = null; // Set the image to null to delete it
  }

}