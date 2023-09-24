import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/constants/constans_model_atributo.dart';
import '../../../../core/utils/extensions/date_extends.dart';
import '../../../../core/utils/style_utils.dart';
import '../../../../data/models/cita/cita_create_model.dart';
import '../../../../data/models/cita/cita_item_model.dart';
import '../../../../data/models/cita/hora_model.dart';
import '../../../../data/models/doctor/doctor_model.dart';
import '../../../../data/models/request_models/cita_request_v2.dart';
import '../../../../data/models/usuario/usuario_responsive.dart';
import '../../../../data/repository_imp/local/local_auth_repository.dart';
import '../../../../domain/repository/icita_repository.dart';
import '../../../../domain/repository/idoctor_repository.dart';
import '../../../../domain/usecases/cita/update_cita_rapida_use_case.dart';
import '../../../global_controllers/dialog_controller.dart';
import '../../../routes/app_routes.dart';

enum ProgressState { oculto, visible }

class CitaListController extends GetxController {
  //useCases
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();
  final IDoctorRepository _doctorRepository = Get.find<IDoctorRepository>();
  final ICitaRepository _citaRepository = Get.find<ICitaRepository>();
  final UpdateCitaRapidaUC _updateCitaRapidaUC;

  Rx<ProgressState> citasIconStateProgress = ProgressState.oculto.obs;
  Rx<ProgressState> deleteCitaProgress = ProgressState.oculto.obs;

  Rx<DateTime> dateInit = DateTime.now().obs;
  Rx<DoctorModel>? doctorModelInit;
  RxDouble progresIndicator = 0.0.obs;

  int iddoctorVerification = 0;
  String fechaVerification = "";
  RxString nombreDiaRx = "".obs;
  RxBool isVerificado = false.obs;
  RxBool isVerificadoToday = true.obs;
  Rx<dynamic> resultPacienteCreateFromCitaReact = Rx({});
  Rx<dynamic> resultCreateCitaReact = Rx({});

  RxList<DoctorModel> doctorList = <DoctorModel>[].obs;
  RxList<HoraModel> horaList = <HoraModel>[].obs;
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

  CitaListController(this._updateCitaRapidaUC);

  @override
  void onReady() async {
    super.onReady();

    // Escuchar los cambios en la variable count y ejecutar un método
    ever(resultCreateCitaReact, (value) {
      citaCreateReturnData();
    });
    ever(resultPacienteCreateFromCitaReact, (value) {
      citaUpdatePacienteReturnData();
    });
    user.value = await _localAuthRepository.currentUser ?? user.value;
    await _getDoctores();

    //init
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
    getListHoraModelFilterToday();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel(); // Cancela el temporizador al finalizar
    _timerprog?.cancel();
  }

  @override
  void onClose() {
    // Tareas de limpieza o liberación de recursos aquí
    super.onClose();
  }

//REACCIONES: los datos que regresa un page cuando hace Get.back
  void citaCreateReturnData() async {
    if (await resultCreateCitaReact.value == null) {
      //significa que no se ha creado una cita
      return;
    }
    //idpersona
    //denominacion de la persona
    //idcita
    //celular
    //razon
    //hora/minuto
    dynamic returnData = await resultCreateCitaReact.value;
    for (int i = 0; i < 10; i++) {}
    for (int i = 0; i < horaList.length; i++) {
      if (horaList[i].hora == returnData[ConstantsCita.HORA_INT]) {
        final newCitaItemModel = CitaItemModel(
            idcita: returnData[ConstantsCita.ID_CITA],
            idpaciente: returnData[ConstantsCita.ID_PACIENTE],
            denominacion: returnData[ConstantsCita.DENOMINACION],
            citaRapidaNombrePaciente:
                returnData[ConstantsCita.CITA_RAPIDA_NOMBRE_PACIENTE],
            celular: returnData[ConstantsCita.CELULAR],
            citaRapidaCelular: returnData[ConstantsCita.CITA_RAPIDA_CELULAR],
            hora: returnData[ConstantsCita.HORA],
            isCitaRapida: returnData[ConstantsCita.IS_CITA_RAPIDA],
            razon: returnData[ConstantsCita.RAZON]);
        horaList[i].razon = returnData[ConstantsCita.RAZON];
        horaList[i].idsede = returnData[ConstantsSede.ID_SEDE];
        horaList[i].sede = returnData[ConstantsSede.SEDE_NOMBRE];
        horaList[i].isLibre = false;
        horaList[i].isOcupado = returnData[ConstantsCita.IS_OCUPADO];

        horaList[i].listCitas.add(newCitaItemModel);

        this.update();
        break;
      }
    }
  }

  void citaUpdatePacienteReturnData() async {
    if (await resultPacienteCreateFromCitaReact.value == null) {
      //significa que no se ha guardado un paciente
      return;
    }
    //idpersona
    //idcita para actualizar que cita
    //celular de la persona
    //denominacion de la persona
    dynamic returnData = await resultPacienteCreateFromCitaReact.value;
    for (HoraModel horaModel in horaList) {
      for (CitaItemModel citaModel in horaModel.listCitas) {
        if (returnData["idcita"] == citaModel.idcita) {
          final newCitaItemModel = CitaItemModel(
            idcita: citaModel.idcita ?? 0,
            hora: citaModel.hora,
            isCitaRapida: false,
            idpaciente: returnData["idpaciente"],
            razon: citaModel.razon,
            celular: returnData["celular"],
            denominacion: returnData["denominacion"],
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
    setFecha(dateNow);
    if (citaRequest.iddoctor != 0) {
      citasIconStateProgress(ProgressState.visible);
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
              horaList.removeLast();
            }
          }
          horaList.addAll(response);
          iddoctorVerification = citaRequest.iddoctor;
          fechaVerification = citaRequest.date;
          dateInit.value = dateNow;
          verificarDatosRequest();
          verificarIsToday(dateNow);
          borrar = true;
          update();
        },
      );
      citasIconStateProgress(ProgressState.oculto);
    }
  }

  Timer? _timer;
  Timer? _timerprog;

  void startGetCitas(DateTime date) {
    _timer?.cancel();
    _timerprog?.cancel();
    progresIndicator.value = 0;

    _timerprog = Timer.periodic(Duration(milliseconds: 10), (timer) {
      progresIndicator.value = progresIndicator.value + 0.13 / 6;
      print(progresIndicator.value);
      if (progresIndicator.value >= 1) {
        timer.cancel();
        progresIndicator.value = 0;
      }
    });

    // Cancela el temporizador existente, si hay alguno
    _timer = Timer(
      Duration(milliseconds: StyleUtils.TIME_WAIT_ASYNC_MILISECONDS_600),
      () {
        // La función callback se ejecuta después de 2 segundos
        getListHoraModelFilterByFecha(date);
      },
    );
  }

  void getListHoraModelFilterByFecha(DateTime dateTime) async {
    setFecha(dateTime);
    if (citaRequest.iddoctor != 0 && !citaRequest.date.isEmpty) {
      citasIconStateProgress(ProgressState.visible);
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
              horaList.removeLast();
            }
          }
          horaList.addAll(response);
          iddoctorVerification = citaRequest.iddoctor;
          fechaVerification = citaRequest.date;
          verificarDatosRequest();
          verificarIsToday(dateInit.value);
          borrar = true;
          update();
        },
      );
    }
    citasIconStateProgress(ProgressState.oculto);
  }

  void getListHoraModelFilterByDoctor(DoctorModel? doctorModel) async {
    setidDoctor(doctorModel);
    if (citaRequest.iddoctor != 0 && !citaRequest.date.isEmpty) {
      citasIconStateProgress(ProgressState.visible);
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
              horaList.removeLast();
            }
          }
          horaList.addAll(response);
          iddoctorVerification = citaRequest.iddoctor;
          fechaVerification = citaRequest.date;
          verificarDatosRequest();
          verificarIsToday(dateInit.value);
          borrar = true;
          update();
        },
      );
    }
    citasIconStateProgress(ProgressState.oculto);
  }

  void eliminarCitaOcupada(HoraModel horaModelSelect) async {
    deleteCitaProgress(ProgressState.visible);
    for (HoraModel horaModel in horaList) {
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
          deleteCitaProgress(ProgressState.oculto);
          return;
        }
      }
    }
  }

  void agregarCitaOcupada(HoraModel horaModelSelect) async {
    deleteCitaProgress(ProgressState.visible);
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
    await result.when(
      left: (systemNotification) {
        DialogController().showDialog001(
            icon: Icons.error_outline_outlined,
            title: systemNotification.titulo,
            mensaje: systemNotification.mensaje,
            twoOptions: false);
      },
      right: (response) {
        idcita = response;
        for (HoraModel horaModel in horaList) {
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
    deleteCitaProgress(ProgressState.oculto);
  }

  void eliminarCita(CitaItemModel citaItemModel) async {
    deleteCitaProgress(ProgressState.visible);
    for (HoraModel horaModel in horaList) {
      for (CitaItemModel citaModel in horaModel.listCitas) {
        if (citaModel.idcita == citaItemModel.idcita) {
          final result =
              await _citaRepository.deleteCita(citaItemModel.idcita ?? 0);
          result.when(left: (systemNotification) {
            DialogController().showDialog001(
              title: systemNotification.titulo,
              mensaje: systemNotification.mensaje,
              twoOptions: false,
            );
          }, right: (Response) {
            Get.back();
            horaModel.isLibre = horaModel.listCitas.length < 2;
            horaModel.listCitas.remove(citaModel);
            update();
          });
          deleteCitaProgress(ProgressState.oculto);
          return;
        }
      }
    }
  }

  Future<bool> updateCita(CitaItemModel citaUpdateModel) async {
    final result = await _updateCitaRapidaUC.call(citaUpdateModel);
    result.when(
      left: (systemNotification) {
        DialogController().showDialog001(
            icon: Icons.error_outline_outlined,
            title: systemNotification.titulo,
            mensaje: systemNotification.mensaje,
            twoOptions: false);
      },
      right: (response) {
        for (HoraModel horaModel in horaList) {
          for (CitaItemModel citaModel in horaModel.listCitas) {
            if (citaModel.idcita == citaUpdateModel.idcita) {
              horaModel.listCitas.remove(citaModel);
              horaModel.listCitas.add(citaUpdateModel);
              update();
              break;
            }
          }
        }
        DialogController().showDialog001(
          icon: Icons.check,
          title: "Modificado",
          mensaje: "Ha sido modificado",
          twoOptions: false,
          withTime: true,
          seconds: 5,
        );
      },
    );
    return true;
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
    print(date);
    print(DateTime.now());
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
      String citafechaName = DateTimeExtensions.toFormattedEEEEdeMMMMdelyyyy(
          DateTimeExtensions.toFormatDateTime(citaRequest.date));

      resultCreateCitaReact.value =
          Get.toNamed(AppRoutes.CITA_CREATE, arguments: {
        //datos mostrar
        'fechaString': citafechaName.toUpperCase(),
        'doctorDenominacion': doctorModelInit?.value.denominacion,
        'hora': horaModel.hora.toString(),
        //datos request
        'fechaCita': citaRequest.date,
        'iddoctor': doctorModelInit?.value.id,
        'isLibre': horaModel.isLibre,
        'idsede': horaModel.idsede,
        'horaInt': horaModel.hora
      });
    } else {
      if (citaRequest.date.isEmpty) {
        DialogController().showDialog001(
            title: "Doctor",
            mensaje: "Doctor no seleccionado",
            twoOptions: false);
      }
      if (citaRequest.iddoctor == 0) {
        DialogController().showDialog001(
            title: "Fecha",
            mensaje: "Fecha no seleccionada",
            twoOptions: false);
      }
    }
  }

  void gotoCitaDetalle(CitaItemModel citaModel) async {
    Get.back();
    await Get.toNamed(AppRoutes.CITA_DETALLE, arguments: citaModel.idcita);
  }

  void gotoPacienteCreateFromCita(CitaItemModel citaItemFilteredModel) async {
    Get.back();
    resultPacienteCreateFromCitaReact.value = Get.toNamed(
      AppRoutes.PACIENTE_CREATE_FROM_CITA,
      arguments: {
        "idcita": citaItemFilteredModel.idcita,
        "doctor": doctorModelInit?.value.denominacion,
        "paciente":
            citaItemFilteredModel.citaRapidaNombrePaciente ?? "SIN NOMBRE",
        "celular": citaItemFilteredModel.citaRapidaCelular ?? "SIN CELULAR",
        "razon": citaItemFilteredModel.razon
      },
    );
  }
}
