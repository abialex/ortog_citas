import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/constants/constans_model_atributo.dart';
import '../../../../core/validators/form_validators.dart';
import '../../../../data/models/cita/cita_create_model.dart';
import '../../../../data/models/container/sede_model.dart';
import '../../../../data/models/doctor/doctor_model.dart';
import '../../../../data/models/usuario/usuario_responsive.dart';
import '../../../../data/repository_imp/local/local_auth_repository.dart';
import '../../../../domain/repository/icita_repository.dart';
import '../../../../domain/repository/ipaciente_repository.dart';
import '../../../global_controllers/dialog_controller.dart';
import '../../../global_controllers/snackbar_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_colors.dart';
import 'models_views/cita_create_form_model.dart';

enum ProgressState { oculto, visible }

class CitaCreateController extends GetxController {
  //useCases
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();
  final ICitaRepository _citaRepository = Get.find<ICitaRepository>();
  final IPacienteRepository _pacienteRepository =
      Get.find<IPacienteRepository>();

  SnackBarController snackbar = SnackBarController();
  RxList<SedeModel> sedeList = <SedeModel>[].obs;
  Rx<UsuarioResponsive> user = UsuarioResponsive(
          id: 0,
          sessionKey: "",
          roles: [],
          sedes: [],
          username: "",
          persona: "")
      .obs;

  Rx<SedeModel>? sedeModelInit;

  final createFormModel = CitaCreateFormModel.initial().obs;

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
  bool borrar = false;
  bool isLibre = false;
  bool isVerificado = false;
  int horaInt = 0;
  final arguments = Get.arguments;
  final fechaCitaCtrl = TextEditingController();
  final doctorCtrl = TextEditingController();
  final horaCtrl = TextEditingController();
  final pacienteCtrl = TextEditingController();
  final dniCtrl = TextEditingController();
  Rx<ProgressState> loginIconState = ProgressState.oculto.obs;

  @override
  void onReady() async {
    super.onReady();
    fechaCitaCtrl.text = arguments["fechaString"];
    doctorCtrl.text = arguments["doctorDenominacion"];
    horaCtrl.text = arguments["hora"];
    isLibre = arguments["isLibre"];
    horaInt = arguments["horaInt"];
    idSede = arguments["idsede"];
    celular = arguments["celular"];
    setHora("00");
    setFecha(arguments["fechaCita"]);
    setidDoctor(arguments["iddoctor"]);
    await getSedes();
  }

  @override
  void onClose() {
    // Tareas de limpieza o liberación de recursos aquí
    update();
    super.onClose();
  }

  //-----------------------------------------------------------------------------------------------
  //methods
  Future<void> getSedes() async {
    UsuarioResponsive? user = await _localAuthRepository.currentUser;
    if (user!.sedes.length < 2 || !isLibre) {
      if (user.sedes.length == 1) {
        if (idSede != null && idSede != user.sedes[0].idsede) {
          gotoBackCancel();
          DialogController().showDialog001(
              icon: Icons.location_city_outlined,
              title: "Sede",
              mensaje: "Tiene una cita en otra sede a la misma hora",
              twoOptions: false);

          return;
        }
        sedeModelInit = user.sedes[0].obs;
        sedeList.add(sedeModelInit!.value);
        setIdSede(sedeModelInit!.value.idsede, sedeModelInit!.value.nombreSede);
        update();
        return;
      }

      try {
        sedeModelInit = user.sedes.firstWhere((e) => e.idsede == idSede).obs;
      } catch (e) {
        DialogController().showDialog001(
            title: "Info", mensaje: "Ya tiene citas en otra ciudad");
      }
      sedeList.add(sedeModelInit!.value);
      setIdSede(sedeModelInit?.value.idsede ?? 0,
          sedeModelInit?.value.nombreSede ?? "");
    } else {
      sedeList.addAll(user.sedes);
    }

    update();
  }

  void getPacienteByDni() async {
    if (dniCtrl.text.length != 8) {
      snackbar.showSnackBar(
        title: "DNI",
        message: "Ingrese un DNI válido",
        color: OrtognaticaColors.amarillo,
      );
      return;
    }

    final result = await _pacienteRepository.getPacienteByDni(dniCtrl.text);

    result.when(
      left: (systemNotification) {
        DialogController().showDialog001(
            icon: Icons.error_outline_outlined,
            title: systemNotification.titulo,
            mensaje: systemNotification.mensaje,
            twoOptions: false);
      },
      right: (response) {
        if (response != null) {
          snackbar.showSnackBar(
            title: "Paciente encontrado",
            message:
                "${response.nombres} ${response.apPaterno} ${response.apMaterno}",
            color: OrtognaticaColors.SLGcolor,
          );
          isVerificado = true;
          setidPaciente(response.id,
              "${response.nombres} ${response.apPaterno} ${response.apMaterno}");
          pacienteCtrl.text =
              "${response.nombres} ${response.apPaterno} ${response.apMaterno}";
          setCitaRapidaCelular(response.celular ?? "");
          update();
        } else {
          snackbar.showSnackBar(
            title: "DNI",
            message: "No está registrado",
            color: OrtognaticaColors.amarillo,
          );
          pacienteCtrl.text = "";
        }
      },
    );
  }

  createCita(CitaCreateModel citaCreateModel) async {
    loginIconState(ProgressState.visible);
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
        int idcita = response;
        gotoBackAceptar(
            idcita: idcita,
            idpaciente: citaCreateModel.idpaciente,
            denominacion: denominacion,
            citaRapidaNombrePaciente: citaCreateModel.citaRapidaNombrePaciente,
            celular: celular,
            citaRapidaCelular: citaCreateModel.citaRapidaCelular,
            hora: citaCreateModel.hora,
            hora_int: horaInt,
            isCitaRapida: citaCreateModel.isCitaRapida,
            idsede: citaCreateModel.idsede,
            sede: sedeString,
            razon: citaCreateModel.razon,
            isOcupado: citaCreateModel.isOcupado);
        // for (var i = 0; i < carritoController.listItems.length; i++) {
        //   if (carritoController.listItems[i].hora == horaInt) {
        //     carritoController.listItems[i].idsede = this.idSede;
        //     carritoController.listItems[i].sede = this.sedeString;
        //     carritoController.listItems[i].razon = this.razon;
        //     carritoController.listItems[i].listCitas.add(CitaItemModel(
        //       idpaciente: idPaciente,
        //       celular: celular,
        //       idcita: idcita,
        //       hora: hora,
        //       razon: razon,
        //       denominacion: denominacion,
        //       isCitaRapida: isCitaRapida.value,
        //       citaRapidaCelular: citaCreateModel.citaRapidaCelular,
        //       citaRapidaNombrePaciente:
        //           citaCreateModel.citaRapidaNombrePaciente,
        //     ));
        //     carritoController.listItems[i].isLibre = false;
        //     carritoController.listItems[i].isOcupado =
        //         !isCita.value && !isCitaRapida.value;
        //     citaListController.update();

        //     break;
        //   }
        // }
      },
    );
    loginIconState(ProgressState.oculto);
  }

  void submit(GlobalKey<FormState> formKey) {
    //setServicioProducto(isSelectedProducto.value);
    bool valid = validarCampos(formKey);
    if (valid) {
      if (idPaciente == 0 && isCita.value) {
        snackbar.showSnackBar(
            title: "Paciente",
            message: "No ha seleccionado un Paciente",
            color: OrtognaticaColors.amarillo);
        return;
      }
      late CitaCreateModel citaCreateModel;
      if (isCita.value) {
        citaCreateModel = createFormModel.value.toEntityCreateCita();
      } else {
        if (isCitaRapida.value) {
          citaCreateModel = createFormModel.value.toEntityCreateCitaRapida();
        } else {
          citaCreateModel = createFormModel.value.toEntityCreateCitaOcupada();
        }
      }
      createCita(citaCreateModel);
    }
  }

  bool validarCampos(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      // Enviar formulario a servidor o realizar alguna acción
      print('Formulario válidoo 👌👌👌');
      return true;
    } else {
      print('Formulario inválido 😵‍💫😵‍💫😵‍💫');
      return false;
    }
  }

  //-------------------------------------------------------------------------------------------------
  //update
  int idPaciente = 0;
  int? idSede = 0;
  RxBool isCita = false.obs;
  RxBool isCitaRapida = true.obs;
  int idDoctor = 0;
  String fechaCita = "";
  String razon = "";
  String hora = "";
  String denominacion = "";
  String sedeString = "";
  String? celular = "";

  void setidPaciente(int idPacien, String denominacion) {
    createFormModel.update((val) {
      val?.idpaciente = idPacien;
    });
    idPaciente = idPacien;
    this.denominacion = denominacion;
  }

  void setCitaRapidaCelular(String? value) {
    if (value?.length == 0) {
      value = null;
    }
    createFormModel.update((val) {
      val?.citaRapidaCelular = value;
    });
    celular = value;
  }

  void setCitaRapidaNombrePaciente(String value) {
    createFormModel.update((val) {
      val?.citaRapidaNombrePaciente = value;
    });
    celular = value;
  }

  void setIdSede(int value, String sedeString) {
    print(value);
    createFormModel.update((val) {
      val?.idsede = value;
    });
    idSede = value;
    this.sedeString = sedeString;
  }

  void setSede(SedeModel? value) {
    createFormModel.update((val) {
      val?.idsede = value?.idsede ?? 0;
    });
    idSede = value?.idsede ?? 0;
    this.sedeString = value?.nombreSede ?? "";
  }

  void setHora(String hor) {
    if (hor.isEmpty) {
      return;
    }
    hora = "${horaCtrl.text}:${hor}:00";
    createFormModel.update((val) {
      val?.hora = hora;
    });
  }

  void setidDoctor(int value) {
    createFormModel.update((val) {
      val?.iddoctor = value;
    });
    idDoctor = value;
  }

  void setFecha(String fecha) {
    createFormModel.update((val) {
      val?.fecha = fecha;
    });
    fechaCita = fecha;
  }

  void setRazon(String raz) {
    this.razon = raz;
    createFormModel.update((val) {
      val?.razon = razon;
    });
  }

  //------------------------------------------------------------------------------------------
  //navigation

  void gotoPacienteCreate() {
    Get.toNamed(AppRoutes.PACIENTE_CREATE);
  }

  gotoBackCancel() {
    Get.back();
  }

  gotoBackAceptar(
      {required int idcita,
      required int? idpaciente,
      required String? denominacion,
      required String? citaRapidaNombrePaciente,
      required String? celular,
      required String? citaRapidaCelular,
      required String hora,
      required int hora_int,
      required bool isCitaRapida,
      required int? idsede,
      required String sede,
      required String? razon,
      required bool isOcupado}) {
    Get.back(result: {
      ConstantsCita.ID_CITA: idcita,
      ConstantsCita.ID_PACIENTE: idpaciente,
      ConstantsCita.DENOMINACION: denominacion,
      ConstantsCita.CITA_RAPIDA_NOMBRE_PACIENTE: citaRapidaNombrePaciente,
      ConstantsCita.CELULAR: celular,
      ConstantsCita.CITA_RAPIDA_CELULAR: citaRapidaCelular,
      ConstantsCita.HORA: hora,
      ConstantsCita.HORA_INT: horaInt,
      ConstantsCita.IS_CITA_RAPIDA: isCitaRapida,
      ConstantsSede.ID_SEDE: idsede,
      ConstantsSede.SEDE_NOMBRE: sede,
      ConstantsCita.RAZON: razon,
      ConstantsCita.IS_OCUPADO: isOcupado,
    });
  }

  //-------------------------------------------------------------------------------------------------------------
  //validators
  final sedeValidators = FormValidators.validatorMixinT<SedeModel>([
    FormValidators.validatorRequiredT<SedeModel>('Sede es requerido'),
  ]);

  final razonValidators = FormValidators.validatorMixin([
    FormValidators.validatorRequired('Razón es requerido'),
  ]);
  bool ols = false;
  final dniValidators = FormValidators.validatorMixin([
    FormValidators.verificacionDNIRequired('Ingrese un DNI'),
  ]);

  final pacienteValidators = FormValidators.validatorMixin([
    FormValidators.validatorRequired('No ha seleccionado al paciente'),
  ]);
  final minutoValidators = FormValidators.validatorMixin([
    FormValidators.validatorLessThan60(60, 'Tiene que ser menor de 60'),
  ]);

  final pacienteNombreValidators = FormValidators.validatorMixin([
    FormValidators.validatorRequired('Ingrese nombres del paciente'),
  ]);
}
