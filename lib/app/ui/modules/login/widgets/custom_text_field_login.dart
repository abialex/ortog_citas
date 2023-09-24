import 'package:flutter/material.dart';

class CustomTextFieldLogin extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final IconButton? suffixIcon;
  const CustomTextFieldLogin(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade100),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade700),
            suffixIcon: suffixIcon),
      ),
    );
  }
}
