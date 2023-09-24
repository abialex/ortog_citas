import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFieldController extends GetxController {
  final textEditingController = TextEditingController();

  var _isObscure = false.obs;
  get isObscure => _isObscure.value;
  set isObscure(value) => _isObscure.value = value;

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}
