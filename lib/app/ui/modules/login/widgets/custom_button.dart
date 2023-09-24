import 'package:flutter/material.dart';

import '../../../../core/utils/style_utils.dart';

class CustomButtonLogin extends StatelessWidget {
  final Function()? onTap;

  const CustomButtonLogin({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.all(StyleUtils.CUSTOM_PADDING_FORM_20_DEFAULT),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black,
        ),
        child: const Center(
          child: Text(
            "Iniciar sesión",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
