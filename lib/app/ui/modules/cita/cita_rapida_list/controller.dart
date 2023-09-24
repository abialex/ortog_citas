import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/cita/cita_rapida_item_model.dart';
import '../../../../data/models/doctor/doctor_model.dart';
import '../../../../data/models/request_models/cita_request_v1.dart';
import '../../../../data/models/system_notification.dart';
import '../../../../domain/repository/icita_repository.dart';
import '../../../../domain/usecases/cita/get_cita_rapida_use_case.dart';
import '../../../global_controllers/carrito_list_controller.dart';
import '../../../global_controllers/dialog_controller.dart';
import '../../../routes/app_routes.dart';

enum ProgressState { oculto, visible }

class CitaRapidaListController extends GetxController {
  //useCases
  final GetCitasRapidasUC _getCitasFilteredUC;
  final CarritoController<CitaRapidaItemModel>
      _carritoCitaItemFilteredController;
  final ICitaRepository _citaRepository = Get.find<ICitaRepository>();

  Rx<ProgressState> loginIconState = ProgressState.oculto.obs;

  Rx<DateTime> dateInit = DateTime.now().obs;
  Rx<DoctorModel>? doctorModelInit;

  int iddoctorVerification = 0;
  String fechaVerification = "";

  RxString nombreDiaRx = "".obs;
  RxBool isVerificado = false.obs;
  RxBool isVerificadoToday = true.obs;

  RxList<CitaRapidaItemModel> citasFilteredsList = <CitaRapidaItemModel>[].obs;

  int oldIndex = -1;
  CitaRequestv1Model citaRequest =
      CitaRequestv1Model(search: "", isCitaRapida: true);
  bool borrar = false;

  final buscarCtrl = TextEditingController();

  CitaRapidaListController(
    this._getCitasFilteredUC,
    this._carritoCitaItemFilteredController,
  );

  @override
  void onReady() async {
    super.onReady();
    await getCitasFilteredModel();
    _carritoCitaItemFilteredController.listItems.addAll(citasFilteredsList);
    _carritoCitaItemFilteredController.onActionDeleteItem = deleteCitaFiltered;
  }

  @override
  void onClose() {
    // Tareas de limpieza o liberación de recursos aquí
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
    buscarCtrl.dispose();
  }

  //-----------------------------------------------------------------------------------------------
  //methods

  Future<void> getCitasFilteredModel() async {
    loginIconState(ProgressState.visible);
    final result = await _getCitasFilteredUC.call(citaRequest);
    result.when(
      left: (systemNotification) {
        DialogController().showDialog001(
            icon: Icons.error_outline_outlined,
            title: systemNotification.titulo,
            mensaje: systemNotification.mensaje,
            twoOptions: false);
      },
      right: (response) {
        citasFilteredsList.clear();
        citasFilteredsList.addAll(response);

        update();
      },
    );

    loginIconState(ProgressState.oculto);
  }

  deleteCitaFiltered(CitaRapidaItemModel citaItemFilteredModel) async {
    final result = await _citaRepository.deleteCita(citaItemFilteredModel.id);
    result.when(left: (systemNotification) {
      SystemNotification(
        titulo: systemNotification.titulo,
        mensaje: systemNotification.mensaje,
        detalle: systemNotification.detalle,
      );
    }, right: (response) {
      int index = citasFilteredsList
          .indexWhere((e) => e.id == citaItemFilteredModel.id);
      citasFilteredsList.removeAt(index);
    });
  }

  //-------------------------------------------------------------------------------------------------
  //setters
  setSearch(String value) {
    citaRequest.search = value;
  }

  //------------------------------------------------------------------------------------
  //navigation
  void gotoPacienteCreateFromCita(
      CitaRapidaItemModel citaItemFilteredModel) async {
    Get.back();
    Get.toNamed(AppRoutes.PACIENTE_CREATE_FROM_CITA, arguments: {
      "idcita": citaItemFilteredModel.id,
      "doctor": citaItemFilteredModel.doctor,
      "paciente":
          citaItemFilteredModel.citaRapidaNombrePaciente ?? "SIN NOMBRE",
      "celular": citaItemFilteredModel.citaRapidaCelular ?? "SIN CELULAR",
      "razon": citaItemFilteredModel.razon
    });
  }
}
