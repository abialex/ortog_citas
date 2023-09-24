import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDatePicker002 extends StatelessWidget {
  final int maximunYear;
  final int minimunYear;
  final CupertinoDatePickerMode mode;
  final DateTime dateInit;
  final Function(DateTime) onChangeDate;
  CustomDatePicker002(
      {Key? key,
      required this.maximunYear,
      required this.minimunYear,
      required this.mode,
      required this.dateInit,
      required this.onChangeDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      height: 80,
      child: CupertinoDatePicker(
          key: UniqueKey(),
          dateOrder: DatePickerDateOrder.ymd,
          maximumYear: maximunYear,
          minimumYear: minimunYear,
          mode: mode,
          initialDateTime: (dateInit)
              .subtract(Duration(hours: 0, minutes: dateInit.minute % 5)),
          minuteInterval: 5,
          onDateTimeChanged: (date) {
            onChangeDate(date);
          }),
    );
  }
}
