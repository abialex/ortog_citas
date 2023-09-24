import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/extensions/date_extends.dart';
import '../../../../data/models/cita/cita_item_model.dart';
import '../../../../data/models/cita/hora_model.dart';
import '../../../../data/models/doctor/doctor_model.dart';
import '../../../../data/models/request_models/cita_request_v2.dart';
import '../../../../data/models/usuario/usuario_responsive.dart';
import '../../../../data/repository_imp/local/local_auth_repository.dart';
import '../../../../domain/repository/icita_repository.dart';
import '../../../../domain/usecases/doctor/get_doctor_by_usuario_id.dart';
import '../../../global_controllers/dialog_controller.dart';
import '../../../routes/app_routes.dart';

enum ProgressState { oculto, visible }

class CitaListDoctorController extends GetxController {
  //useCases
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();
  final ICitaRepository _citaRepository = Get.find<ICitaRepository>();
  final GetDoctorByUsuarioIdUC _getDoctorByUsuarioIdUC;
  RxList<HoraModel> citasList = <HoraModel>[].obs;
  Rx<UsuarioResponsive> user = UsuarioResponsive(
          id: 0,
          sessionKey: "",
          roles: [],
          sedes: [],
          username: "",
          persona: "")
      .obs;

  Rx<ProgressState> loginIconState = ProgressState.oculto.obs;

  Rx<DateTime> dateInit = DateTime.now().obs;
  Rx<DoctorModel>? doctorModelInit;

  int iddoctorVerification = 0;
  String fechaVerification = "";

  RxString nombreDiaRx = "".obs;
  RxBool isVerificado = false.obs;
  RxBool isVerificadoToday = true.obs;

  List<RxBool> listbool = [
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
  ];
  List<String> listTime = [
    "08 AM",
    "09 AM",
    "10 AM",
    "11 AM",
    "12 PM",
    "03 PM",
    "04 PM",
    "05 PM",
    "06 PM",
    "07 PM",
    "08 PM"
  ];
  int oldIndex = -1;
  CitaRequestv2Model citaRequest = CitaRequestv2Model(iddoctor: 0, date: "");
  bool borrar = false;

  CitaListDoctorController(
    this._getDoctorByUsuarioIdUC,
  );

  @override
  void onReady() async {
    super.onReady();
    user.value = await _localAuthRepository.currentUser ?? user.value;
    final result = await _getDoctorByUsuarioIdUC.call(user.value.id);
    result.when(left: (systemNotification) {
      DialogController().showDialog002(
        icon: Icons.error,
        title: systemNotification.titulo,
        mensaje: systemNotification.mensaje,
        twoOptions: false,
      );
    }, right: (response) {
      if (response != null) {
        setidDoctor(response.id);
        setFecha(DateTime.now());
        getListHoraModelFilter();
      } else {
        DialogController().showDialog001(
          icon: Icons.error,
          title: "Doctor",
          mensaje: "El doctor con este usuario na ha sido encontrado",
          twoOptions: false,
        );
      }
    });
  }

  @override
  void onClose() {
    // Tareas de limpieza o liberación de recursos aquí
    print('El controlador se ha cerrado');
    super.onClose();
  }

  //-----------------------------------------------------------------------------------------------
  //methods
  void getListHoraModelFilterToday() async {
    DateTime dateNow = DateTime.now();
    if (citaRequest.iddoctor != 0) {
      citaRequest.date =
          DateTimeExtensions.toFormattedEEEEdeMMMMdelyyyy(dateNow);
      loginIconState(ProgressState.visible);
      final result = await _citaRepository.getCitaFilterToday(citaRequest);
      result.when(
        left: (systemNotification) {
          DialogController().showDialog001(
              icon: Icons.error_outline_outlined,
              title: systemNotification.titulo,
              mensaje: systemNotification.mensaje,
              twoOptions: false);
        },
        right: (response) {
          if (borrar) {
            for (var i = 0; i < response.length; i++) {
              citasList.removeLast();
            }
          }
          citasList.addAll(response);
          iddoctorVerification = citaRequest.iddoctor;
          fechaVerification = citaRequest.date;
          dateInit.value = dateNow;
          setFecha(dateNow);
          verificarIsToday(dateNow);
          borrar = true;
        },
      );
      loginIconState(ProgressState.oculto);
    }
    update();
  }

  getListHoraModelFilter() async {
    if (citaRequest.iddoctor != 0 && !citaRequest.date.isEmpty) {
      loginIconState(ProgressState.visible);
      final result = await _citaRepository.getCitaFilterToday(citaRequest);
      result.when(left: (systemNotification) {
        DialogController().showDialog001(
            icon: Icons.error_outline_outlined,
            title: systemNotification.titulo,
            mensaje: systemNotification.mensaje,
            twoOptions: false);
      }, right: (response) {
        if (borrar) {
          for (var i = 0; i < response.length; i++) {
            citasList.removeLast();
          }
        }
        citasList.addAll(response);
        iddoctorVerification = citaRequest.iddoctor;
        fechaVerification = citaRequest.date;
        verificarDatosRequest();
        verificarIsToday(dateInit.value);
        borrar = true;
        loginIconState(ProgressState.oculto);
      });
    }
    update();
  }

  verificarDatosRequest() {
    if (citaRequest.iddoctor == iddoctorVerification &&
        citaRequest.date == fechaVerification) {
      isVerificado.value = true;
      return;
    }
    isVerificado.value = false;
  }

  verificarIsToday(DateTime date) {
    isVerificadoToday.value =
        DateTimeExtensions.isEquealDate(DateTime.now(), date);
  }

  //-------------------------------------------------------------------------------------------------
  //update
  void setidDoctor(int id) {
    citaRequest.iddoctor = id;
    verificarDatosRequest();
  }

  void setFecha(DateTime fecha) {
    citaRequest.date = DateTimeExtensions.toFormattedyyyyMMdd(fecha);
    dateInit.value = fecha;
    verificarDatosRequest();
    nombreDiaRx.value = DateTimeExtensions.toFormattedEEEE(fecha);
  }

  //------------------------------------------------------------------------------------
  //navigation
  void gotoPacienteDetalle(CitaItemModel citaItemModel) {
    Get.back();
    Get.toNamed(AppRoutes.PACIENTE_DETALLE,
        arguments: citaItemModel.idpaciente);
  }

  void gotoCitaDetalle(CitaItemModel citaModel) async {
    Get.back();
    await Get.toNamed(AppRoutes.CITA_DETALLE, arguments: citaModel.idcita);
  }
}
