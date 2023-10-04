import 'package:ortog_citas/app/core/utils/style_utils.dart';
import 'package:flutter/material.dart';

import '../../../../theme/app_colors.dart';

class CustomFieldWidget extends StatelessWidget {
  //if label is ""? sizedbox.shrink()
  //if onPressed is null? sizedbox.shrink()
  final EdgeInsets padding;
  final String label;
  final TextStyle styleLabel;
  final String hintText;
  final TextStyle styleHint;
  final double height;
  final Icon icon;
  final Function()? onPressed;
  final TextEditingController? controller;
  final int flexlabel;
  final int flexField;
  final int flexIcon;
  final AlignmentGeometry imagAlign;
  final bool isOculto;
  final TextInputAction? textInputAction;

  const CustomFieldWidget({
    super.key,
    required this.label,
    this.icon = const Icon(Icons.image),
    this.height = 35,
    this.controller,
    this.padding = const EdgeInsets.symmetric(vertical: 0),
    this.styleLabel =
        const TextStyle(color: OrtogColors.white, fontWeight: FontWeight.w500),
    this.styleHint = const TextStyle(
      fontFamily: "Roboto",
      color: OrtogColors.greyWhite,
    ),
    this.isOculto = false,
    this.onPressed,
    required this.hintText,
    this.flexlabel = 2,
    this.flexField = 5,
    this.flexIcon = 1,
    this.imagAlign = Alignment.centerLeft,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            flex: flexlabel,
            child: label != ""
                ? Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Text(
                      label,
                      style: styleLabel,
                      textAlign: TextAlign.right,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          Expanded(
            flex: flexField,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: OrtogColors.white),
              ),
              child: SizedBox(
                height: height,
                child: FieldWidget(
                  isOculto: isOculto,
                  controller: controller,
                  styleHint: styleHint,
                  hintText: hintText,
                  textInputAction: textInputAction,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FieldWidget extends StatelessWidget {
  const FieldWidget({
    super.key,
    required this.controller,
    required this.styleHint,
    this.hintText,
    required this.isOculto,
    this.textInputAction,
  });

  final bool isOculto;
  final TextEditingController? controller;
  final TextStyle styleHint;
  final String? hintText;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      obscureText: isOculto,
      controller: controller,
      style:
          const TextStyle(color: OrtogColors.white, fontSize: StyleUtils.P2_13),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(left: StyleUtils.SIZE_LABEL_SPACE_5),
        hintText: hintText,
        hintStyle: styleHint,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
