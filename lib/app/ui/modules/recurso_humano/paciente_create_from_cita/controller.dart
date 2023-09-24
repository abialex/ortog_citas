import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/validators/form_validators.dart';
import '../../../../data/models/cita/cita_rapida_item_model.dart';
import '../../../../data/models/contenedor_model.dart';
import '../../../../data/models/paciente/paciente_create_from_cita_model.dart';
import '../../../../data/models/persona/persona_sunat_model.dart';
import '../../../../domain/repository/icontenedor_repository.dart';
import '../../../../domain/usecases/paciente/create_paciente_from_cita_use_case.dart';
import '../../../global_controllers/carrito_list_controller.dart';
import '../../../global_controllers/dialog_controller.dart';
import 'models_views/paciente_create_from_cita_form_model.dart';

class PacienteCreateFromCitaController extends GetxController {
//-----------------------------------------------------RX---------------------------------------------------------
  final IContenedorRepository _contenedorRepository =
      Get.find<IContenedorRepository>();
  final CreatePacienteFromCitaUC _createPacienteFromCitaUC;
  final CarritoController<CitaRapidaItemModel> carritoController =
      Get.find<CarritoController<CitaRapidaItemModel>>();

//-----------------------------------------------------RX--------------------------------------------------------
  final form = PacienteCreateFromCitaFormModel.initial().obs;
  Rx<DateTime> initialDate = DateTime(1900, 1, 1).obs;
  Rx<DateTime> selectedDateFechaNacimiento = DateTime.now().obs;

  Rx<DateTime> selectDate = DateTime(2000, 1, 1).obs;
  DateTime firstday = DateTime(1900);
  DateTime lastDate = DateTime(2025);
  Rx<String> search = "".obs;
  int idcita = 0;
  String doctor = "";
  String paciente = "";
  String? celular;
  String razon = "";

  RxList<ContenedorModel> contenedorTipoGenero = <ContenedorModel>[].obs;
  RxList<ContenedorModel> contenedorTipoDocumento = <ContenedorModel>[].obs;
  RxList<ContenedorModel> contenedorTipoOcupacion = <ContenedorModel>[].obs;

//-----------------------------------------------------RX FIN---------------------------------------------------------
  PacienteCreateFromCitaController(
    this._createPacienteFromCitaUC,
  );

  final fechaCitaCtrl = TextEditingController();
  final nombresCtrl = TextEditingController();
  final apellidoPaternoCtrl = TextEditingController();
  final apellidoMaternoCtrl = TextEditingController();
  final dateFechaNacimientoCtrl = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    dynamic data = Get.arguments as dynamic;
    idcita = data["idcita"];
    doctor = data["doctor"];
    paciente = data["paciente"];
    celular = data["celular"];
    razon = data["razon"];
    _getTipoGeneros();
    _getTipoDocumento();
    _getTipoOcupacion();
    setIdCita(idcita);
  }

  @override
  void dispose() {
    super.dispose();
    fechaCitaCtrl.dispose();
    nombresCtrl.dispose();
    apellidoPaternoCtrl.dispose();
    apellidoMaternoCtrl.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //-----------------------------------------------------
//methods
  getPersonaSunat(PersonaSunatModel? personaSunat) {
    nombresCtrl.text = personaSunat?.nombres ?? "";
    apellidoPaternoCtrl.text = personaSunat?.apellidoPaterno ?? "";
    apellidoMaternoCtrl.text = personaSunat?.apellidoMaterno ?? "";
    setNombres(personaSunat?.nombres ?? "");
    setApellidoPaterno(personaSunat?.apellidoPaterno ?? "");
    setApellidoMaterno(personaSunat?.apellidoMaterno ?? "");
  }

  _getTipoGeneros() async {
    final result = await _contenedorRepository.getContenedorTipoGenero();
    result.when(
      left: (systemNotification) {
        DialogController().showDialog001(
          icon: Icons.error_outline_outlined,
          title: systemNotification.titulo,
          mensaje: systemNotification.mensaje,
          twoOptions: false,
        );
      },
      right: (response) {
        contenedorTipoGenero.addAll(response);
        update();
      },
    );
  }

  _getTipoDocumento() async {
    final result = await _contenedorRepository.getContenedorTipoDocumento();
    result.when(
      left: (systemNotification) {
        DialogController().showDialog001(
          icon: Icons.error_outline_outlined,
          title: systemNotification.titulo,
          mensaje: systemNotification.mensaje,
          twoOptions: false,
        );
      },
      right: (response) {
        contenedorTipoDocumento.addAll(response);
        update();
      },
    );
  }

  _getTipoOcupacion() async {
    final result = await _contenedorRepository.getContenedorTipoOcupacion();
    result.when(
      left: (systemNotification) {
        DialogController().showDialog001(
          icon: Icons.error_outline_outlined,
          title: systemNotification.titulo,
          mensaje: systemNotification.mensaje,
          twoOptions: false,
        );
      },
      right: (response) {
        contenedorTipoOcupacion.addAll(response);
        update();
      },
    );
  }

  void submit(GlobalKey<FormState> formKey) {
    bool valid = validarCampos(formKey);
    if (valid) {
      PacienteCreateFromCitaModel pacienteCreateModel = form.value.toEntity();
      createPaciente(pacienteCreateModel);
    }
  }

  void createPaciente(PacienteCreateFromCitaModel pacienteCreateModel) async {
    final result = await _createPacienteFromCitaUC.call(pacienteCreateModel);

    result.when(
      left: (systemNotification) {
        DialogController().showDialog002(
          icon: Icons.error_outline_outlined,
          title: systemNotification.titulo,
          mensaje: systemNotification.mensaje,
          twoOptions: false,
        );
      },
      right: (response) {
        gotoBackAceptar(
            idpersona: response,
            idcita: idcita,
            celular: pacienteCreateModel.celular,
            denominacion:
                "${pacienteCreateModel.nombres} ${pacienteCreateModel.apPaterno} ${pacienteCreateModel.apMaterno}");
        DialogController().showDialog001(
            title: "Paciente Creado / Cita Actualizada",
            mensaje:
                "${pacienteCreateModel.nombres}  ${pacienteCreateModel.apPaterno}",
            twoOptions: false,
            icon: Icons.personal_injury_outlined);

        carritoController.onActionDeleteItem(CitaRapidaItemModel(
            id: idcita,
            fechaCita: "",
            hora: "",
            iddoctor: 0,
            doctor: doctor,
            razon: razon,
            isOcupado: false,
            isCitaRapida: false));
      },
    );
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

  //-------------------------------------------------------------------------------------------
  // update values form

  void setNombres(String value) {
    form.update((val) {
      val?.nombres = value;
    });
  }

  void setApellidoPaterno(String value) {
    form.update((val) {
      val?.apPaterno = value;
    });
  }

  void setApellidoMaterno(String value) {
    form.update((val) {
      val?.apMaterno = value;
    });
  }

  void setTipoGenero(ContenedorModel? value) {
    form.update((val) {
      val?.idgenero = value!.id;
    });
  }

  void setTipoOcupacion(ContenedorModel? value) {
    form.update((val) {
      val?.idocupacion = value!.id;
    });
  }

  void setTipoDocumento(ContenedorModel? value) {
    form.update((val) {
      val?.idtipodoc = value!.id;
    });
  }

  void setFechaNacimiento(String value) {
    form.update((val) {
      val?.fechaNacimiento = value;
    });
  }

  void setNumDocumento(String value) {
    form.update((val) {
      val?.dni = value;
    });
  }

  void setCelular(String value) {
    form.update((val) {
      val?.celular = value;
    });
  }

  void setCorreo(String value) {
    form.update((val) {
      val?.correo = value;
    });
  }

  void setDni(String value) {
    form.update((val) {
      val?.dni = value;
    });
  }

  void setDomicilio(String value) {
    form.update((val) {
      val?.domicilio = value.isEmpty ? null : value;
    });
  }

  void setLugarProcedencia(String value) {
    form.update((val) {
      val?.lugarProcedencia = value.isEmpty ? null : value;
    });
  }

  void setEnfermedadActual(String value) {
    form.update((val) {
      val?.enfermedadActual = value;
    });
  }

  void setAntecendes(String value) {
    form.update((val) {
      val?.antecedentes = value;
    });
  }

  void setMotivoConsulta(String value) {
    form.update((val) {
      val?.motivoConsulta = value;
    });
  }

  void setIdCita(int value) {
    form.update((val) {
      val?.idcita = value;
    });
  }

  //-------------------------------------------------------------------------------------------
  //validators

  final nombresValidators = FormValidators.validatorMixin([
    FormValidators.validatorRequired('Nombres es requerido'),
  ]);
  final apellidoPaternoValidators = FormValidators.validatorMixin([
    FormValidators.validatorRequired('Apellido paterno es requerido'),
  ]);
  final apellidoMaternoValidators = FormValidators.validatorMixin([
    FormValidators.validatorRequired('Apellido materno es requerido'),
  ]);

  final tipoGeneroValidators = FormValidators.validatorMixinT<ContenedorModel>([
    FormValidators.validatorRequiredT<ContenedorModel>('Género es requerido'),
  ]);
  final tipoOcupacionValidators =
      FormValidators.validatorMixinT<ContenedorModel>([
    FormValidators.validatorRequiredT<ContenedorModel>(
        'Ocupación es requerido'),
  ]);

  final tipoDocumentoValidators =
      FormValidators.validatorMixinT<ContenedorModel>([
    FormValidators.validatorRequiredT<ContenedorModel>(
        'Tipo de documento es requerido'),
  ]);
  final numDocValidators = FormValidators.validatorMixin([
    FormValidators.validatorRequired('numero doc. es requerido'),
  ]);

  final fechaNacimientoValidators = FormValidators.validatorMixin([
    FormValidators.validatorRequired('Fecha de nacimiento es requerido'),
  ]);

  final motivoConsultaValidators = FormValidators.validatorMixin([
    FormValidators.validatorRequired('Motivo de consulta es requerido'),
  ]);

  final correoValidators = FormValidators.validatorMixin([
    FormValidators.validatorEmail('Ingrese un correo válido'),
  ]);
  gotoBackCancel() {
    Get.back();
  }

  gotoBackAceptar(
      {required int idpersona,
      required int idcita,
      required String? celular,
      required String denominacion}) {
    Get.back(result: {
      "idpersona": idpersona,
      "idcita": idcita,
      "celular": celular,
      "denominacion": denominacion
    });
  }
}
