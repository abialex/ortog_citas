import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  final String title;
  final String message;
  final Color backgroundColor;
  final Color colorText;
  final Color overlayColor;
  final Color progressIndicatorBackgroundColor;
  final int seconds;
  final Icon icon;
  const CustomSnackbar({
    required this.title,
    required this.message,
    this.backgroundColor = const Color.fromARGB(255, 71, 73, 204),
    this.colorText = Colors.white,
    this.overlayColor = Colors.orange,
    this.progressIndicatorBackgroundColor = Colors.red,
    this.seconds = 2,
    this.icon = const Icon(
      Icons.error,
      color: Colors.red,
      size: 30,
    ),
  });

  void showSnacbar() {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor,
      colorText: colorText,
      overlayColor: overlayColor,
      progressIndicatorBackgroundColor: progressIndicatorBackgroundColor,
      duration: Duration(seconds: seconds),
      icon: icon,
    );
  }
}
