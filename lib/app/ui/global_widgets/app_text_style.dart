import 'package:flutter/material.dart';

class ConstTextApp {
  static Text miniText({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Text(
      text,
      softWrap: true,
      maxLines: maxLines ?? 1,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 12,
        color: color,
        fontWeight: fontWeight,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  static Text lightText({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Text(
      text,
      softWrap: true,
      maxLines: maxLines ?? 1,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        color: color,
        fontWeight: fontWeight,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  static Text mediumText({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: TextStyle(
        fontSize: fontSize ?? 21,
        color: color,
        fontWeight: fontWeight,
      ),
      maxLines: maxLines ?? 1,
    );
  }

  static Text largeText({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize ?? 31,
        color: color,
        fontWeight: fontWeight,
      ),
      maxLines: maxLines ?? 1,
    );
  }

  static Text labelLightText({
    required String text,
    double? fontSize,
    Color colorText = Colors.black,
    TextAlign? textAlign,
    TextOverflow textOverflow = TextOverflow.ellipsis,
    int maxLines = 1,
  }) =>
      ConstTextApp.lightText(
        text: text,
        fontWeight: FontWeight.bold,
        color: colorText,
        fontSize: fontSize,
        textAlign: textAlign,
        maxLines: maxLines,
        // textOverflow: textOverflow,
        // maxLines: maxLines,
      );
}
