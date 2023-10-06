import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final int maxLine;
  final String hintText;
  final TextEditingController controller;
  final Function(String) onChanged;
  final String? Function(String?) validators;
  const CustomTextArea({
    super.key,
    this.maxLine = 7,
    required this.hintText,
    required this.controller,
    required this.onChanged,
    required this.validators,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      child: TextFormField(
        validator: validators,
        onChanged: onChanged,
        controller: controller,
        maxLines: maxLine, // Establece el número de líneas
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
