import 'package:ortog_citas/app/data/models/cita/cita_create_model.dart';
import 'package:ortog_citas/app/data/models/cita/cita_item_model.dart';
import 'package:ortog_citas/app/data/models/cita/hora_model.dart';
import 'package:ortog_citas/app/data/models/request_models/cita_request_v2.dart';
import 'package:ortog_citas/app/data/models/usuario/usuario_responsive.dart';
import 'package:ortog_citas/app/data/repository_imp/local/local_auth_repository.dart';
import 'package:ortog_citas/app/domain/repository/idoctor_repository.dart';
import 'package:ortog_citas/app/ui/global_controllers/dialog_controller.dart';
import 'package:ortog_citas/app/ui/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../../../core/utils/extensions/date_extends.dart';
import '../../../../data/models/doctor/doctor_model.dart';
import '../../../../domain/repository/icita_repository.dart';
import '../../../global_controllers/carrito_list_controller.dart';

enum ProgressState { oculto, visible }

class CitaListController extends GetxController {
  //useCases
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();
  final IDoctorRepository _doctorRepository = Get.find<IDoctorRepository>();
  final ICitaRepository _citaRepository = Get.find<ICitaRepository>();
  final CarritoController<HoraModel> carritoController =
      Get.find<CarritoController<HoraModel>>();

  Rx<ProgressState> loginIconState = ProgressState.oculto.obs;

  Rx<DateTime> dateInit = DateTime.now().obs;
  Rx<DoctorModel>? doctorModelInit;

  int iddoctorVerification = 0;
  String fechaVerification = "";
  RxString nombreDiaRx = "".obs;
  RxBool isVerificado = false.obs;
  RxBool isVerificadoToday = true.obs;
  Rx<dynamic> resultado = Rx({});

  RxList<DoctorModel> doctorList = <DoctorModel>[].obs;
  Rx<UsuarioResponsive> user = UsuarioResponsive(
          id: 0,
          sessionKey: "",
          roles: [],
          sedes: [],
          username: "",
          persona: "")
      .obs;

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
  CitaRequestv2Model citaRequest =
      CitaRequestv2Model(iddoctor: 0, date: "2023-01-01");
  bool borrar = false;

  @override
  void onReady() async {
    super.onReady();

    // Escuchar los cambios en la variable count y ejecutar un método
    ever(resultado, (value) {
      updateCitaReact();
    });
    user.value = await _localAuthRepository.currentUser ?? user.value;
    await _getDoctores();

    //init
    setFecha(DateTime.now());
    DoctorModel? doctorModel = await _localAuthRepository.doctorSelected;
    if (doctorModel != null) {
      for (var docItem in doctorList) {
        if (docItem.id == doctorModel.id) {
          doctorModelInit?.value = docItem;
          setidDoctor(docItem);
          break;
        }
      }
    }
    getListHoraModelFilter();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    // Tareas de limpieza o liberación de recursos aquí
    super.onClose();
  }

  void updateCitaReact() async {
    if (await resultado.value == null) {
      //significa que no se ha guardado un paciente
      return;
    }
    //idpersona
    //idcita para actualizar que cita
    //celular de la persona
    //denominacion de la persona
    dynamic resultadoReac = await resultado.value;
    for (HoraModel horaModel in carritoController.listItems) {
      for (CitaItemModel citaModel in horaModel.listCitas) {
        if (resultadoReac["idcita"] == citaModel.idcita) {
          final newCitaItemModel = CitaItemModel(
            idcita: citaModel.idcita ?? 0,
            hora: citaModel.hora,
            isCitaRapida: false,
            idpaciente: resultadoReac["idpaciente"],
            razon: citaModel.razon,
            celular: resultadoReac["celular"],
            denominacion: resultadoReac["denominacion"],
          );
          horaModel.listCitas.remove(citaModel);
          horaModel.listCitas.add(newCitaItemModel);
          update();

          break;
        }
      }
    }
  }

  //-----------------------------------------------------------------------------------------------
  //methods
  Future<void> _getDoctores() async {
    doctorList.clear();
    final result =
        await _doctorRepository.getPersonasDoctorByIdUsuario(user.value.id);
    result.when(left: (systemNotification) {
      DialogController().showDialog002(
        icon: Icons.error,
        title: systemNotification.titulo,
        mensaje: systemNotification.mensaje,
        twoOptions: false,
      );
    }, right: (response) {
      doctorList.addAll(response);
      update();
    });
  }

  void getListHoraModelFilterToday() async {
    DateTime dateNow = DateTime.now();
    if (citaRequest.iddoctor != 0) {
      citaRequest.date = DateTimeExtensions.toFormattedyyyyMMdd(dateNow);
      loginIconState(ProgressState.visible);
      final result = await _citaRepository.getCitaFilterToday(citaRequest);
      result.when(
        left: (systemNotification) {
          DialogController().showDialog001(
            icon: Icons.error_outline_outlined,
            title: systemNotification.titulo,
            mensaje: systemNotification.mensaje,
          );
        },
        right: (response) {
          if (borrar) {
            for (var i = 0; i < response.length; i++) {
              carritoController.listItems.removeLast();
            }
          }
          carritoController.listItems.addAll(response);
          iddoctorVerification = citaRequest.iddoctor;
          fechaVerification = citaRequest.date;
          dateInit.value = dateNow;
          setFecha(dateNow);
          verificarIsToday(dateNow);
          borrar = true;
          update();
        },
      );
      loginIconState(ProgressState.oculto);
    }
  }

  void getListHoraModelFilter() async {
    if (citaRequest.iddoctor != 0 && !citaRequest.date.isEmpty) {
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
              carritoController.listItems.removeLast();
            }
          }
          carritoController.listItems.addAll(response);
          iddoctorVerification = citaRequest.iddoctor;
          fechaVerification = citaRequest.date;
          verificarDatosRequest();
          verificarIsToday(dateInit.value);
          borrar = true;
          update();
        },
      );
    }
    loginIconState(ProgressState.oculto);
  }

  void eliminarCitaOcupada(HoraModel horaModelSelect) async {
    for (HoraModel horaModel in carritoController.listItems) {
      for (CitaItemModel citaModel in horaModel.listCitas) {
        if (horaModelSelect.listCitas[0].idcita == citaModel.idcita) {
          final result =
              await _citaRepository.deleteCita(citaModel.idcita ?? 0);
          result.when(
            left: (systemNotification) {
              DialogController().showDialog001(
                  icon: Icons.error_outline_outlined,
                  title: systemNotification.titulo,
                  mensaje: systemNotification.mensaje,
                  twoOptions: false);
            },
            right: (response) {
              horaModel.isLibre = true;
              horaModel.isOcupado = false;
              horaModel.listCitas.remove(citaModel);
              update();
            },
          );
          return;
        }
      }
    }
  }

  void agregarCitaOcupada(HoraModel horaModelSelect) async {
    CitaCreateModel citaCreateModel = new CitaCreateModel(
      fechaCita: citaRequest.date,
      hora: "${horaModelSelect.hora}:00:00",
      iddoctor: citaRequest.iddoctor,
      razon: null,
      isOcupado: true,
      idsede: null,
      idpaciente: null,
      isCitaRapida: false,
    );
    int idcita = 0;
    final result = await _citaRepository.createCita(citaCreateModel);
    result.when(
      left: (systemNotification) {
        DialogController().showDialog001(
            icon: Icons.error_outline_outlined,
            title: systemNotification.titulo,
            mensaje: systemNotification.mensaje,
            twoOptions: false);
      },
      right: (response) {
        idcita = response;
        for (HoraModel horaModel in carritoController.listItems) {
          if (horaModel.hora == horaModelSelect.hora) {
            horaModel.listCitas.add(CitaItemModel(
              idcita: idcita,
              hora: citaCreateModel.hora,
              razon: citaCreateModel.razon ?? "sin razón",
              isCitaRapida: false,
            ));
            horaModel.isLibre = false;
            horaModel.isOcupado = true;
            update();
            break;
          }
        }
      },
    );
  }

  void eliminarCita(CitaItemModel citaItemModel) async {
    for (HoraModel horaModel in carritoController.listItems) {
      for (CitaItemModel citaModel in horaModel.listCitas) {
        if (citaModel.idcita == citaItemModel.idcita) {
          _citaRepository.deleteCita(citaItemModel.idcita ?? 0);
          horaModel.isLibre = horaModel.listCitas.length < 2;
          horaModel.listCitas.remove(citaModel);
          update();
          Get.back();
          break;
        }
      }
    }
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
  //setters
  void setidDoctor(DoctorModel? doctorModel) {
    citaRequest.iddoctor = doctorModel?.id ?? 0;
    if (doctorModel != null) {
      doctorModelInit = doctorModel.obs;
      _localAuthRepository.setDoctorSelected(doctorModel);
    }
    verificarDatosRequest();
  }

  void setFecha(DateTime fecha) {
    citaRequest.date = DateTimeExtensions.toFormattedyyyyMMdd(fecha);
    dateInit.value = fecha;
    nombreDiaRx.value = DateTimeExtensions.toFormattedEEEE(fecha);
    verificarDatosRequest();
  }

  //------------------------------------------------------------------------------------
  //navigation
  void gotoCitaCreate(HoraModel horaModel) async {
    if (!citaRequest.date.isEmpty && citaRequest.iddoctor != 0) {
      DateTime fecha = DateFormat('yyyy-MM-dd').parse(citaRequest.date);
      await initializeDateFormatting('es');
      String citafechaName =
          DateFormat('EEEE d \'de\' MMMM \'del\' yyyy', 'ES').format(fecha);
      await Get.toNamed(AppRoutes.CITA_CREATE, arguments: {
        'doctor': doctorModelInit?.toJson(),
        'fechaCita': citafechaName.toUpperCase(),
        'fechaString': citaRequest.date,
        'hora': horaModel.hora.toString(),
        'isLibre': horaModel.isLibre,
        'idsede': horaModel.idsede,
        'horaInt': horaModel.hora
      });
    } else {
      //mensaje de que debe seleccionar;
    }
  }

  void gotoCitaDetalle(CitaItemModel citaModel) async {
    Get.back();
    await Get.toNamed(AppRoutes.CITA_DETALLE, arguments: citaModel.idcita);
  }

  void gotoPacienteCreateFromCita(CitaItemModel citaItemFilteredModel) async {
    Get.back();
    resultado.value =
        Get.toNamed(AppRoutes.PACIENTE_CREATE_FROM_CITA, arguments: {
      "idcita": citaItemFilteredModel.idcita,
      "doctor": doctorModelInit?.value.denominacion,
      "paciente":
          citaItemFilteredModel.citaRapidaNombrePaciente ?? "SIN NOMBRE",
      "celular": citaItemFilteredModel.citaRapidaCelular ?? "SIN CELULAR",
      "razon": citaItemFilteredModel.razon
    });
  }
}
