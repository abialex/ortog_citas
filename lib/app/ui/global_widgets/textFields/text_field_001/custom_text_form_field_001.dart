import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/style_utils.dart';
import '../../../theme/app_colors.dart';

enum InputFormatEnum {
  letras,
  numeros,
  numerosDecimales,
  ambos;
}

class TextFormFieldCustom001 extends StatelessWidget {
  final String hintText;
  final double paddingLeft;
  final Function(String)? onChanged;
  final String? Function(String?) validators;
  final Function(String?)? saveds;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final TextAlign textAlign;
  final double fontSize;
  final TextInputAction? textInputAction;
  //final double height;
  // final double heightError;
  final bool isCollapsed;
  final Icon? icon;
  final bool isEnabled;
  final int maxlength;
  final InputFormatEnum inputFormat;
  final EdgeInsets contentPadding;

  const TextFormFieldCustom001(
      {super.key,
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
      this.paddingLeft = 0,
      this.textInputAction = TextInputAction.done,
      this.isCollapsed = false,
      this.icon = const Icon(Icons.edit),
      this.isEnabled = true,
      this.maxlength = 150,
      this.inputFormat = InputFormatEnum.ambos,
      this.saveds,
      this.contentPadding = const EdgeInsets.fromLTRB(
        StyleUtils.CUSTOM_PADDING_FORM_10_DEFAULT,
        5,
        StyleUtils.CUSTOM_PADDING_FORM_10_DEFAULT,
        5,
      )});

  TextInputFormatter _inputFormatted(InputFormatEnum state) {
    switch (state) {
      case InputFormatEnum.letras:
        return FilteringTextInputFormatter.allow(
            RegExp(r'[a-zA-ZáÁéÉíÍóÓúÚüÜñÑ\s]'));
      case InputFormatEnum.numeros:
        return FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));

      case InputFormatEnum.numerosDecimales:
        return FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'));

      case InputFormatEnum.ambos:
        return FilteringTextInputFormatter.allow(
            RegExp(r'[a-zA-ZáÁéÉíÍóÓúÚüÜñÑ\s0-9.,-]'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      padding: EdgeInsets.fromLTRB(paddingLeft, 5, 0, 5),
      child: TextFormField(
        inputFormatters: [
          _inputFormatted(inputFormat),
          LengthLimitingTextInputFormatter(maxlength)
        ],
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
              color: OrtognaticaColors.lightGrey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: OrtognaticaColors.lightGrey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: OrtognaticaColors.azul_principal,
            ),
          ),

          // errorBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(20),
          //   borderSide: const BorderSide(
          //     color: OdebinColors.rojo,
          //   ),
          // ),

          prefixIcon: prefixIcon,
          contentPadding: contentPadding,
        ),
        onChanged: onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onSaved: saveds,
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
