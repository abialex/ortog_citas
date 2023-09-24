import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/contenedor_model.dart';
import '../../../../data/models/paciente/paciente_item_model.dart';
import '../../../../data/models/request_models/paciente_request.dart';
import '../../../../domain/usecases/paciente/get_filter_paciente.dart';
import '../../../global_controllers/carrito_list_controller.dart';
import '../../../global_controllers/dialog_controller.dart';
import '../../../routes/app_routes.dart';
import 'models_views/paciente_update_form_model.dart';

enum ProgressState { oculto, visible }

class PacienteListController extends GetxController {
//-----------------------------------------------------RX---------------------------------------------------------
  final GetFilterPacienteUC _getFilterPacienteUC;
  final CarritoController<PacienteItemModel> _carritoPacienteController;
//-----------------------------------------------------RX--------------------------------------------------------
  final form = PacienteUpdateFormModel.initial().obs;

  PacienteListController(
    this._getFilterPacienteUC,
    this._carritoPacienteController,
  );
  Rx<DateTime> selectDate = DateTime.now().obs;
  DateTime firstday = DateTime(1910);
  DateTime lastDate = DateTime(2025);
  PacienteRequest pacienteRequest = PacienteRequest(
    search: "",
    estado: true,
    pageIndex: 1,
    pageSize: 10,
  );
  RxList<PacienteItemModel> pacientesList = <PacienteItemModel>[].obs;
  RxList<ContenedorModel> contenedorTipoGenero = <ContenedorModel>[].obs;
  RxList<ContenedorModel> contenedorTipoDocumento = <ContenedorModel>[].obs;
  RxList<ContenedorModel> contenedorTipoOcupacion = <ContenedorModel>[].obs;

  Rx<ProgressState> loginIconState = ProgressState.oculto.obs;
//-----------------------------------------------------RX FIN---------------------------------------------------------

  final fechaCitaCtrl = TextEditingController();

  @override
  void onReady() async {
    super.onReady();
    loginIconState(ProgressState.visible);
    await consultarPaciente();

    _carritoPacienteController.listItems.addAll(pacientesList);
    _carritoPacienteController.onActionAddItem = addPaciente;
    _carritoPacienteController.onActionUpdateItem = modificarPaciente;
    loginIconState(ProgressState.oculto);
  }

  @override
  void dispose() {
    super.dispose();
    liberarCarrito();
  }

  //----------------------------------------------------------------
  //seter
  void setSearch(String value) {
    pacienteRequest.search = value;
  }

  //-----------------------------------------------------
//methods
  Future<void> consultarPaciente() async {
    loginIconState(ProgressState.visible);
    int cant = pacientesList.length;
    for (var i = 0; i < cant; i++) {
      pacientesList.removeLast();
    }
    final result = await _getFilterPacienteUC.call(pacienteRequest);
    result.when(
      left: (systemNotification) {
        DialogController().showDialog001(
            icon: Icons.error_outline_outlined,
            title: systemNotification.titulo,
            mensaje: systemNotification.mensaje,
            twoOptions: false);
      },
      right: (response) {
        pacientesList.addAll(response);
      },
    );

    update();
    loginIconState(ProgressState.oculto);
  }

  void addPaciente(PacienteItemModel pacienteItemModel) {
    pacientesList.insert(0, pacienteItemModel);
    update();
  }

  void modificarPaciente(PacienteItemModel pacienteItemModel) {
    for (var i = 0; i < pacientesList.length; i++) {
      if (pacientesList[i].id == pacienteItemModel.id) {
        pacientesList[i] = pacienteItemModel;
        update();
        break;
      }
    }
  }

  void liberarCarrito() {
    Get.delete<CarritoController>();
  }

  //-------------------------------------------------------------------------------------------
  // update values form

  //-------------------------------------------------------------------------------------------
  //validators

  //----------------------------------------------------------------
  //navigations
  void gotoPacienteCreate() {
    Get.toNamed(AppRoutes.PACIENTE_CREATE);
  }

  void gotoPacienteUpdate(PacienteItemModel pacienteItemModel) {
    Get.back();
    Get.toNamed(AppRoutes.PACIENTE_UPDATE, arguments: pacienteItemModel.id);
  }

  void gotoPacienteDetalle(PacienteItemModel pacienteItemModel) {
    Get.back();
    Get.toNamed(AppRoutes.PACIENTE_DETALLE, arguments: pacienteItemModel.id);
  }
}
