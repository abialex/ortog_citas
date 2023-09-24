import 'package:flutter/material.dart';

import 'app_theme_dark.dart';
import 'app_theme_light.dart';

class AppThemeData {
  static ThemeData light = lightTheme;
  static ThemeData dark = darkTheme;

  // static AppThemeData get light {
  //   return ThemeData.light().copyWith(
  //     appBarTheme: AppBarTheme(
  //       // titleTextStyle: GoogleFonts.poppins(color:OdebinColors.white,fontSize:16.0,)
  //       backgroundColor: OdebinColors.dark,
  //       elevation: 1.0,
  //       iconTheme: const IconThemeData(color: Colors.black),
  //     ),
  //     elevatedButtonTheme: ElevatedButtonThemeData(
  //       style: ElevatedButton.styleFrom(
  //         minimumSize: const Size.fromHeight(48.0),
  //         onPrimary: OdebinColors.white,
  //         // textStyle: GoogleFonts.poppins(color:OdebinColors.white,fontSize:16.0,)
  //         primary: OdebinColors.amarillo,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(5.0),
  //         ),
  //       ),
  //     ),
  //     iconTheme: const IconThemeData(
  //       color: OdebinColors.icon,
  //     ),
  //     inputDecorationTheme: InputDecorationTheme(
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(5.0),
  //         borderSide: const BorderSide(color: OdebinColors.amarillo),
  //       ),
  //       contentPadding: const EdgeInsets.symmetric(
  //         vertical: 10.0,
  //         horizontal: 10.0,
  //       ),
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(5.0),
  //         borderSide: const BorderSide(color: OdebinColors.amarillo),
  //       ),
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(5.0),
  //       ),
  //       // labelStyle: GoogleFonts.poppins(color:OdebinColors.white,fontSize:16.0,),
  //     ),
  //     scaffoldBackgroundColor: OdebinColors.dark,
  //     textButtonTheme: TextButtonThemeData(
  //       style: TextButton.styleFrom(
  //         // textStyle: GoogleFonts.poppins(color:OdebinColors.white,fontSize:16.0,),
  //         primary: OdebinColors.dark,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(5.0),
  //         ),
  //       ),
  //     ),
  //     textTheme: TextTheme(
  //         // bodyText2: GoogleFonts.poppins(color:OdebinColors.text)
  //         // bodyText1: GoogleFonts.poppins(color:OdebinColors.red)
  //         // subtitle1: GoogleFonts.poppins(color:OdebinColors.text)
  //         ),
  //   );
  // }
}
