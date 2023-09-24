// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'custom_dropdown_controller.dart';

// class CustomDropdown<T> extends StatelessWidget {
//   final CustomDropdownController<T> controller;
//   final List<T> items;
//   final Widget Function(T item) builder;
//   final double? width;
//   final double? height;
//   final Color? buttonColor;
//   final Color? dropdownColor;
//   final IconData? icon;

//   const CustomDropdown({
//     required this.controller,
//     required this.items,
//     required this.builder,
//     this.width,
//     this.height,
//     this.buttonColor,
//     this.dropdownColor,
//     this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,
//       height: height,
//       child: Obx(() {
//         return DropdownButtonHideUnderline(
//           child: DropdownButton<T>(
//             icon: Icon(icon),
//             isExpanded: true,
//             style: TextStyle(color: Colors.black),
//             value: controller.selectedItem.value,
//             onChanged: (value) {
//               controller.selectItem(value!);
//             },
//             items: items.map((item) {
//               return DropdownMenuItem<T>(
//                 value: item,
//                 child: builder(item),
//               );
//             }).toList(),
//           ),
//         );
//       }),
//     );
//   }
// }
