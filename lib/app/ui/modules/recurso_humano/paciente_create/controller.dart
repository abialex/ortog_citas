import 'package:ortog_citas/app/core/utils/extensions/date_extends.dart';
import 'package:ortog_citas/app/data/models/paciente/paciente_create_model.dart';
import 'package:ortog_citas/app/ui/global_controllers/dialog_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/snackbar.dart';
import '../../../../core/validators/form_validators.dart';
import '../../../../data/models/contenedor_model.dart';
import '../../../../data/models/paciente/paciente_item_model.dart';
import '../../../../data/models/persona/persona_sunat_model.dart';
import '../../../../domain/repository/icontenedor_repository.dart';
import '../../../../domain/usecases/paciente/create_paciente.dart';
import '../../../global_controllers/carrito_list_controller.dart';
import '../../../theme/app_colors.dart';
import 'models_views/paciente_create_form_model.dart';

class PacienteCreateController extends GetxController {
//-----------------------------------------------------RX---------------------------------------------------------
  final IContenedorRepository _contenedorRepository =
      Get.find<IContenedorRepository>();
  final CreatePacienteUC _createPacienteUC;
  final CarritoController<PacienteItemModel> _carritoPacienteController =
      Get.find<CarritoController<PacienteItemModel>>();

//-----------------------------------------------------RX--------------------------------------------------------
  final form = PacienteCreateFormModel.initial().obs;

  Rx<DateTime> selectDate = DateTime(2000, 1, 1).obs;
  DateTime firstday = DateTime(1900);
  DateTime lastDate = DateTime(2025);

  RxList<ContenedorModel> contenedorTipoGenero = <ContenedorModel>[].obs;
  RxList<ContenedorModel> contenedorTipoDocumento = <ContenedorModel>[].obs;
  RxList<ContenedorModel> contenedorTipoOcupacion = <ContenedorModel>[].obs;

  final nombresCtrl = TextEditingController();
  final apellidoPaternoCtrl = TextEditingController();
  final apellidoMaternoCtrl = TextEditingController();

//-----------------------------------------------------RX FIN---------------------------------------------------------
  PacienteCreateController(
    this._createPacienteUC,
  );

  final fechaCitaCtrl = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    _getTipoGeneros();
    _getTipoDocumento();
    _getTipoOcupacion();
    setFechaNacimiento(DateTime(2000, 1, 1));
  }

  @override
  void onClose() {
    super.onClose();
  }

  //-----------------------------------------------------
//methods
  _getTipoGeneros() async {
    final result = await _contenedorRepository.getContenedorTipoGenero();
    result.when(
      left: (systemNotification) {
        DialogController().showDialog001(
          icon: Icons.error_outline_outlined,
          title: systemNotification.titulo,
          mensaje: systemNotification.mensaje,
        );
      },
      right: (response) {
        contenedorTipoGenero.addAll(response);
        update();
      },
    );
  }

  getPersonaSunat(PersonaSunatModel? personaSunat) {
    nombresCtrl.text = personaSunat?.nombres ?? "";
    apellidoPaternoCtrl.text = personaSunat?.apellidoPaterno ?? "";
    apellidoMaternoCtrl.text = personaSunat?.apellidoMaterno ?? "";
    setNombres(personaSunat?.nombres ?? "");
    setApellidoPaterno(personaSunat?.apellidoPaterno ?? "");
    setApellidoMaterno(personaSunat?.apellidoMaterno ?? "");
  }

  _getTipoDocumento() async {
    final result = await _contenedorRepository.getContenedorTipoDocumento();
    result.when(
      left: (systemNotification) {
        DialogController().showDialog001(
          icon: Icons.error_outline_outlined,
          title: systemNotification.titulo,
          mensaje: systemNotification.mensaje,
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
      PacienteCreateModel pacienteCreateModel = form.value.toEntity();

      createPaciente(pacienteCreateModel);
    }
  }

  void createPaciente(PacienteCreateModel pacienteCreateModel) async {
    final result = await _createPacienteUC.call(pacienteCreateModel);

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
        int id = response;
        CustomSnackbar(
          title: "Paciente Creado",
          message:
              "${pacienteCreateModel.nombres}  ${pacienteCreateModel.apPaterno}",
          seconds: 3,
          icon: Icon(
            Icons.warning,
            color: OrtogColors.amarillo,
          ),
        );
        _carritoPacienteController.addItem(PacienteItemModel(
            id: id,
            dni: pacienteCreateModel.dni,
            denominacion:
                "${pacienteCreateModel.nombres} ${pacienteCreateModel.apPaterno} ${pacienteCreateModel.apMaterno}"
                    .toUpperCase(),
            idgenero: pacienteCreateModel.idgenero,
            idtipodoc: pacienteCreateModel.idtipodoc,
            fechaNacimiento: pacienteCreateModel.fechaNacimiento,
            edad: 0,
            motivoConsulta: pacienteCreateModel.motivoConsulta,
            enfermedadActual: pacienteCreateModel.enfermedadActual,
            antecedentes: pacienteCreateModel.antecedentes,
            ocupacion: "",
            genero: "",
            tipodoc: "",
            tipodocAbrev: contenedorTipoDocumento
                .firstWhere((e) => form.value.idtipodoc == e.id)
                .abrev,
            idocupacion: pacienteCreateModel.idocupacion,
            is_active: true,
            is_activeText: "ACTIVO",
            correo: pacienteCreateModel.correo,
            domicilio: pacienteCreateModel.domicilio,
            celular: pacienteCreateModel.celular));
        gotoBack();
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

  void setFechaNacimiento(DateTime value) {
    form.update((val) {
      val?.fechaNacimiento = DateTimeExtensions.toFormattedyyyyMMdd(value);
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
      val?.domicilio = value;
    });
  }

  void setLugarProcedencia(String value) {
    form.update((val) {
      val?.lugarProcedencia = value;
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

  gotoBack() {
    Get.back();
  }
}
