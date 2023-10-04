import 'package:flutter/material.dart';

import '../../../../core/utils/style_utils.dart';
import '../../../theme/app_colors.dart';

class CustomDropdownButtonFormField<T> extends StatelessWidget {
  final IconData? icon;
  final String? hintText;
  final List<T> items;
  final T? value;
  final Function(T?) onChanged;
  final String? Function(T?)? validators;
  final double height;
  final bool isCollapsed;

  const CustomDropdownButtonFormField({
    Key? key,
    required this.items,
    required this.onChanged,
    this.value,
    this.icon,
    this.hintText,
    this.validators,
    this.height = 10,
    this.isCollapsed = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: OdebinColors.amarillo,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      padding: const EdgeInsets.fromLTRB(5, 5, 0, 10),
      // height: isError ? errorHeight : height,
      child: Column(
        children: [
          DropdownButtonFormField<T>(
            borderRadius: BorderRadius.circular(10),
            isExpanded: true,
            disabledHint: Text(
              hintText ?? "seleccionar",
              style: TextStyle(height: 0.8, fontSize: StyleUtils.P0_15),
            ),
            // isDense: true,

            decoration: InputDecoration(
              floatingLabelAlignment: FloatingLabelAlignment.start,
              isCollapsed: isCollapsed,
              // labelText: labelText,
              hintText: hintText,
              hintStyle: TextStyle(fontSize: StyleUtils.P0_15),
              hintTextDirection: TextDirection.ltr,
              alignLabelWithHint: true,
              //textAlign: TextAlign.center,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: OrtogColors.lightGrey,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: OrtogColors.lightGrey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: OrtogColors.ortog_color,
                ),
              ),
              // errorBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10),
              //   borderSide: BorderSide(color: Colors.greenAccent),
              // ),
              suffixIcon: icon != null ? Icon(icon) : null,
              contentPadding: EdgeInsets.fromLTRB(
                StyleUtils.CUSTOM_PADDING_FORM_10_DEFAULT,
                (height / 2) + 2,
                StyleUtils.CUSTOM_PADDING_FORM_10_DEFAULT,
                height / 2,
              ),
            ),
            value: value,
            onChanged: (dynamic newValue) {
              onChanged(newValue);
            },
            validator: (dynamic value) {
              var res = validators!(value);
              if (res != null) {
                return res;
              }
              return res;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            items: items.map((item) {
              return DropdownMenuItem(
                alignment: Alignment.center,
                value: item,
                child: Text(
                  item.toString(),
                  maxLines: 2,
                  style: TextStyle(fontSize: StyleUtils.P0_15),
                  overflow: TextOverflow.ellipsis,
                  //style: labelSelectStyle,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
