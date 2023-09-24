import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/style_utils.dart';
import '../../../theme/app_colors.dart';

class TextFormFieldCustom001 extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;
  final String? Function(String?) validators;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final TextAlign textAlign;
  final double fontSize;
  final TextInputAction? textInputAction;
  //final double height;
  // final double heightError;
  final bool isCollapsed;
  final Icon icon;
  final bool isEnabled;
  final int maxlength;

  const TextFormFieldCustom001({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.validators,
    this.controller,
    required this.keyboardType,
    this.prefixIcon,
    this.textAlign = TextAlign.left,
    this.fontSize = StyleUtils.P0_15,
    //this.height = StyleUtils.HEIGHT_35_NORMAL,
    //this.heightError = StyleUtils.HEIGHT_60_X_LARGE,
    this.textInputAction = TextInputAction.done,
    this.isCollapsed = false,
    this.icon = const Icon(Icons.edit),
    this.isEnabled = true,
    this.maxlength = 150,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
      child: TextFormField(
        inputFormatters: [LengthLimitingTextInputFormatter(maxlength)],
        enabled: isEnabled,
        decoration: InputDecoration(
          suffixIcon: icon,
          isCollapsed: isCollapsed,
          isDense: true,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: StyleUtils.P0_15,
          ),

          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: SlgColors.lightGrey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: SlgColors.lightGrey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: SlgColors.azul_principal,
            ),
          ),

          // errorBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(20),
          //   borderSide: const BorderSide(
          //     color: OdebinColors.rojo,
          //   ),
          // ),

          prefixIcon: prefixIcon,
          contentPadding: const EdgeInsets.fromLTRB(
            StyleUtils.CUSTOM_PADDING_FORM_10_DEFAULT,
            5,
            StyleUtils.CUSTOM_PADDING_FORM_10_DEFAULT,
            5,
          ),
        ),
        onChanged: onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        keyboardType: keyboardType,
        validator: validators,
        textInputAction: textInputAction,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
