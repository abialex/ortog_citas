import 'package:get/get.dart';

import 'custom_drop_item_01.dart';

class DropdownController extends GetxController {
  var selectedValue = ''.obs;
  var dropdownItems = <DropdownItem>[].obs;

  void onDropdownChanged(String? value) {
    selectedValue.value = value ?? '';
  }

  void setDropdownItems(List<DropdownItem> items) {
    dropdownItems.value = items;
  }
}
