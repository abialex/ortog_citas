import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final TextStyle textStyle;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.grey,
    this.borderRadius = 10.0,
    this.textStyle = const TextStyle(fontSize: 16),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
        style: textStyle,
      ),
    );
  }
}
