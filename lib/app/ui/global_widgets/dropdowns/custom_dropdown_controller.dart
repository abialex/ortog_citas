import 'package:get/get.dart';

class DropdownController<T> extends GetxController {
  final RxList<T> selectedItems = <T>[].obs;
  final bool isMultiSelect;

  DropdownController({this.isMultiSelect = false});

  void toggleSelection(T value) {
    if (isMultiSelect) {
      if (selectedItems.contains(value)) {
        selectedItems.remove(value);
      } else {
        selectedItems.add(value);
      }
    } else {
      selectedItems.value = [value];
    }
  }
}
