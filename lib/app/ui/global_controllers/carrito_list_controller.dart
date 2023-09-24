import 'package:get/get.dart';

class CarritoController<T> extends GetxController {
  Function(T) onActionAddItem = (param) {
    print("execute mujer");
  };
  Function(T) onActionUpdateItem = (param) {};
  Function(T) onActionDeleteItem = (param) {};
  @override
  void onInit() {
    super.onInit();
  }

  final List<T> listItems = [];
  //carrito seleccionados
  addItem(T producto) {
    listItems.add(producto);
    onActionAddItem(producto);
  }

  modificarItem(int index, T item) {
    onActionUpdateItem(item);
    listItems[index] = item;
  }

  eliminarItem(int index) {
    listItems.removeAt(index);
  }

  //carrito temporal
  final RxList<T> listProductSelect = <T>[].obs;
  int addItemSeleccionado(T producto) {
    print(listProductSelect.length);
    if (!listProductSelect.contains(producto)) {
      listProductSelect.add(producto);
      return -1;
    }
    return listProductSelect.indexOf(producto);
  }

  T getItem(int index) {
    return listProductSelect[index];
  }

  modificarItemSeleccionado(int index, T a) {
    listProductSelect[index] = a;
  }

  eliminarItemSeleccionado(int index) {
    listProductSelect.removeAt(index);
  }

  //----------------------------------------------------------------
  //methods
  agregarItemsSeleccionados() {
    listItems.addAll(listProductSelect);
    listProductSelect.clear();
  }

  cleanItems() {
    listItems.clear();
    listProductSelect.clear();
  }
}
