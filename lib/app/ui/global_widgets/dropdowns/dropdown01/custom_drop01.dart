// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'custom_drop_item_01.dart';

// class CustomDropdown<T> extends StatelessWidget {
//   final List<DropdownItem<T>> items;
//   final double fontSize;
//   final Color fontColor;
//   final Color backgroundColor;
//   final EdgeInsets margin;
//   final EdgeInsets padding;
//   final bool isMultiSelect;

//   const CustomDropdown({
//     Key? key,
//     required this.items,
//     this.fontSize = 16,
//     this.fontColor = Colors.black,
//     this.backgroundColor = Colors.white,
//     this.margin = const EdgeInsets.all(0),
//     this.padding = const EdgeInsets.all(0),
//     this.isMultiSelect = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = isMultiSelect ? <T>[].obs : Rx<T?>(null);
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ElevatedButton(
//           onPressed: () async {
//             final result = await showDialog(
//               context: context,
//               builder: (context) => AlertDialog(
//                 content: DropdownButtonList<T>(
//                   items: items,
//                   fontSize: fontSize,
//                   fontColor: fontColor,
//                   backgroundColor: backgroundColor,
//                   margin: margin,
//                   padding: padding,
//                 ),
//               ),
//             );

//             if (result != null) {
//               if (isMultiSelect) {
//                 controller.add(result as T);
//               } else {
//                 controller.value = result as T?;
//               }
//             }
//           },
//           child: Obx(() {
//             if (isMultiSelect) {
//               if (controller.isEmpty) {
//                 return Text('Select');
//               } else {
//                 return Text('${controller.length} selected');
//               }
//             } else {
//               if (controller.value == null) {
//                 return Text('Select');
//               } else {
//                 return Text(
//                     '${items.firstWhere((e) => e.value == controller.value).label}');
//               }
//             }
//           }),
//         ),
//       ],
//     );
//   }
// }
