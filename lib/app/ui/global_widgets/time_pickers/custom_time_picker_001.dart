import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../core/utils/style_utils.dart';
import '../../theme/app_colors.dart';

class CustomTimePicker001 extends StatelessWidget {
  final TextEditingController controller;
  // final String labelText;
  final DateTime firstDate;
  final Rx<TimeOfDay>? initialDate;
  final DateTime lastDate;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String hintText;
  final Widget? prefixIcon;
  final bool isCollapsed;
  final double height;
  final double iconSize;
  const CustomTimePicker001({
    Key? key,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          border: Border.all(color: OrtognaticaColors.lightGrey),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      padding: const EdgeInsets.all(0),
      child: Stack(
        children: [
          TextFormField(
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            expands: true,
            minLines: null,
            maxLines: null,
            readOnly: true,
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.watch_later_outlined,
                size: iconSize,
                color: OrtognaticaColors.dark,
              ),
              isCollapsed: true,
              isDense: true,
              filled: true,
              // labelText: labelText,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: OrtognaticaColors.dark,
                fontSize: StyleUtils.P0_15,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.zero, borderSide: BorderSide.none),

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
            ),

            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            onTap: () async {
              TimeOfDay? selectedDate = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              if (selectedDate != null) {
                initialDate?.value = selectedDate;
                controller.text = "${selectedDate.format(context)}";
                onChanged!(controller.text);
              }
            },
            validator: validator,
            style: const TextStyle(
              color: OrtognaticaColors.dark,
              fontSize: StyleUtils.P0_15,
            ),
            //onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
