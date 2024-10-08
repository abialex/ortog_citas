import 'package:flutter/material.dart';

import '../../../../../core/utils/style_utils.dart';
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

  const CustomFieldWidget({
    super.key,
    required this.label,
    this.icon = const Icon(Icons.image),
    this.height = 35,
    this.controller,
    this.padding = const EdgeInsets.symmetric(vertical: 0),
    this.styleLabel =
        const TextStyle(color: SlgColors.white, fontWeight: FontWeight.w500),
    this.styleHint = const TextStyle(
      fontFamily: "Roboto",
      color: Colors.black,
    ),
    this.isOculto = false,
    this.onPressed,
    required this.hintText,
    this.flexlabel = 2,
    this.flexField = 5,
    this.flexIcon = 1,
    this.imagAlign = Alignment.centerLeft,
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
                border: Border.all(color: SlgColors.white),
              ),
              child: SizedBox(
                height: height,
                child: FieldWidget(
                  isOculto: isOculto,
                  controller: controller,
                  styleHint: styleHint,
                  hintText: hintText,
                ),
              ),
            ),
          ),
          Expanded(
            flex: flexIcon,
            child: onPressed != null
                ? Container(
                    alignment: imagAlign,
                    child: IconButton(
                      icon: icon,
                      onPressed: onPressed,
                      color: SlgColors.white,
                    ),
                  )
                : const SizedBox.shrink(),
          )
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
  });

  final bool isOculto;
  final TextEditingController? controller;
  final TextStyle styleHint;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isOculto,
      controller: controller,
      style:
          const TextStyle(color: SlgColors.white, fontSize: StyleUtils.P2_13),
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
