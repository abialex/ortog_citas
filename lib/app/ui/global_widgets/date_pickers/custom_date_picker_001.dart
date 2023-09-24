import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../core/utils/style_utils.dart';
import '../../theme/app_colors.dart';

class CustomDatePicker001 extends StatelessWidget {
  final TextEditingController controller;
  // final String labelText;
  final DateTime firstDate;
  final Rx<DateTime>? initialDate;
  final DateTime lastDate;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String hintText;
  final Widget? prefixIcon;
  final bool isCollapsed;
  final double height;
  final double iconSize;
  final String helptText;
  final DatePickerEntryMode initialEntryMode;
  const CustomDatePicker001(
      {Key? key,
      required this.controller,
      // required this.labelText,
      this.initialDate,
      required this.firstDate,
      required this.lastDate,
      this.validator,
      required this.onChanged,
      required this.hintText,
      this.prefixIcon,
      this.isCollapsed = true,
      this.height = 35,
      this.iconSize = 25,
      this.helptText = "Seleccione una Fecha",
      this.initialEntryMode = DatePickerEntryMode.calendar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: TextFormField(
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        minLines: null,
        maxLines: null,
        readOnly: true,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.calendar_month,
            size: iconSize,
            color: SlgColors.greyWhite,
          ),
          isCollapsed: true,
          isDense: true,
          filled: true,
          // labelText: labelText,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: StyleUtils.P0_15,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,

          prefixIcon: prefixIcon,
          // suffixIcon: const Icon(
          //   Icons.calendar_today,
          // ),
          contentPadding: const EdgeInsets.fromLTRB(
            StyleUtils.CUSTOM_PADDING_FORM_10_DEFAULT,
            5,
            StyleUtils.CUSTOM_PADDING_FORM_10_DEFAULT,
            5,
          ),
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
              color: SlgColors.dark,
            ),
          ),
        ),

        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        onTap: () async {
          DateTime? selectedDate = await showDatePicker(
              //keyboardType: TextInputType.streetAddress,
              initialEntryMode: initialEntryMode,
              helpText: helptText,
              context: context,
              initialDate: initialDate?.value ?? DateTime.now(),
              firstDate: firstDate,
              lastDate: lastDate,
              fieldHintText: "ss");
          if (selectedDate != null) {
            initialDate?.value = selectedDate;
            controller.text = "${selectedDate.toLocal()}".split(' ')[0];
            onChanged!(controller.text);
          }
        },
        validator: validator,
        style: const TextStyle(
          fontSize: StyleUtils.P0_15,
        ),
        //onChanged: onChanged,
      ),
    );
  }
}
