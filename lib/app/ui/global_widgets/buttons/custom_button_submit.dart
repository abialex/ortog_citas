import 'package:flutter/material.dart';

//import 'package:get/get.dart';

import '../../theme/app_colors.dart';

// class ButtonSubmit<T extends GetxController> extends StatelessWidget {
class CustomButtonSubmit extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final double borderCircular;
  final Color color;
  final Color textColor;
  final EdgeInsetsGeometry? margin;
  // final EdgeInsetsGeometry? padding;
  final double paggingInsetsButtonValue;
  final double paggingInsetsHorizontalTextValue;
  final double paggingInsetsVerticalTextValue;
  final Function()? onTap;
  //final T controllerFunction;

  CustomButtonSubmit({
    required this.text,
    this.width,
    this.height,
    this.color = OrtognaticaColors.OrtogColor,
    this.textColor = OrtognaticaColors.blanco_principal,
    this.margin,
    this.borderCircular = 10.0,
    // this.padding,
    this.paggingInsetsButtonValue = 5,
    this.paggingInsetsVerticalTextValue = 20,
    this.paggingInsetsHorizontalTextValue = 5,
    this.onTap,
    //required this.controllerFunction,
  });

  @override
  Widget build(BuildContext context) {
    // return
    //  GetBuilder<T>(
    //  builder: (controllerFunction) =>
    return Padding(
      padding: EdgeInsets.all(paggingInsetsButtonValue),
      child: GestureDetector(
        onTap: () => onTap?.call(),
        child: Container(
          margin: margin,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderCircular),
            color: color,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: paggingInsetsHorizontalTextValue,
                vertical: paggingInsetsVerticalTextValue),
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // color: OdebinColors.dark,
          // height: 20,
        ),
      ),
    );
    // ); //GetBuilder
  }
}
