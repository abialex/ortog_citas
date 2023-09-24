import 'package:flutter/material.dart';

import '../../ui/theme/app_colors.dart';

class StyleUtils {
  static const double SIZED_FLOW_STATE = 450;
  static const double SIZE_STATE_1 = 4;
  static const double SIZE_STATE_2 = ((SIZED_FLOW_STATE - 50) / 5) * 1;
  static const double SIZE_STATE_3 = ((SIZED_FLOW_STATE - 50) / 5) * 2;

  static const double SIZED_PANEL_ITEM = 40;
  static const double SIZED_PANEL_ITEM_ORDER = 90;

  static const Color PRIMARY_OD = SlgColors.azul_principal;
  static const Color SECONDARY_OD = SlgColors
      .oscuro_principal; //WARNING,DANGER,INFO,NORMAL,BACKGROUND,UNNOTICED

  static const double H0_40 = 40;
  static const double H1_32 = 32;
  static const double H2_26 = 26;
  static const double H3_24 = 24;
  static const double H4_22 = 22;
  static const double H5_20 = 20;
  static const double H6_18 = 18;
  static const double H7_17 = 17;

  static const double P0_15 = 15;
  static const double P1_14 = 14;
  static const double P2_13 = 13;
  static const double P3_12 = 12;
  static const double P4_11 = 11;

// para manejar la altura de 1 - 3 filas en el customBottomSheet
  static const double CUSTOM_BOTTOM_SHEET_1_ROW = 130;
  static const double CUSTOM_BOTTOM_SHEET_2_ROW = 210;
  static const double CUSTOM_BOTTOM_SHEET_3_ROW = 290;

  static const double SIZE_ROW_SPACE_5 = 5;
  static const double SIZE_LABEL_SPACE_5 = 5;
  static const double SIZE_WIDGET_SPACE_15 = 15;

  static const double CUSTOM_PADDING_FORM_5_DEFAULT = 5;
  static const double CUSTOM_PADDING_FORM_10_DEFAULT = 10;
  static const double CUSTOM_PADDING_FORM_15_DEFAULT = 15;
  static const double CUSTOM_PADDING_FORM_20_DEFAULT = 20;
  static const double CUSTOM_PADDING_FORM_25_DEFAULT = 25;

  static const double MAX_HEIGHT_IMAG_300 = 300;
  static const double MAX_HEIGHT_IMAG_150 = 150;
  static const double MAX_WIDTH_IMAG_400 = 400;

  static const double MAX_WIDTH_SCREEN = 450;

  //manejador de repsuestas
  static const int TIME_WAIT_ASYNC_MILISECONDS_500 = 500;
  static const int TIME_WAIT_ASYNC_MILISECONDS_600 = 600;
  static const int TIME_WAIT_ASYNC_MILISECONDS_750 = 750;
  static const int TIME_WAIT_ASYNC_SECONDS = 1;
}
