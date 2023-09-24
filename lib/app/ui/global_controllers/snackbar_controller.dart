import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarController extends GetxController {
  void showSnackBar(
      {required String title, required String message, required Color color}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: color,
        duration: const Duration(seconds: 2),
        colorText: Colors.white);
  }

  void showBottomSheet() {
    // Get.bottomSheet(

    // )
  }
  void showDialog(String title, String assets, String animation) {
    Get.dialog(Container(
      child: AlertDialog(
        title: Text(title),
        actions: <Widget>[
          TextButton(onPressed: () => Get.back(), child: const Text('ok')),
        ],
      ),
    ));
  }
}
