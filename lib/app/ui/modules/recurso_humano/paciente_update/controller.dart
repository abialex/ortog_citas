import 'package:ortog_citas/app/core/utils/extensions/date_extends.dart';
import 'package:ortog_citas/app/core/utils/snackbar.dart';
import 'package:ortog_citas/app/data/models/paciente/paciente_update_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/validators/form_validators.dart';
import '../../../../data/models/contenedor_model.dart';
import '../../../../data/models/paciente/paciente_item_model.dart';
import '../../../../domain/repository/icontenedor_repository.dart';
import '../../../../domain/usecases/paciente/get_byid_paciente.dart';
import '../../../../domain/usecases/paciente/update_paciente.dart';
import '../../../global_controllers/carrito_list_controller.dart';
import '../../../global_controllers/dialog_controller.dart';
import '../../../theme/app_colors.dart';
import 'models_views/paciente_update_form_model.dart';

enum ProgressState { oculto, visible }

class PacienteUpdateController extends GetxController {
//-----------------------------------------------------RX---------------------------------------------------------
  final IContenedorRepository _contenedorRepository =
      Get.find<IContenedorRepository>();
  final CarritoController<PacienteItemModel> _carritoPacienteController =
      Get.find<CarritoController<PacienteItemModel>>();

  final UpdatePacienteUC _updatePacienteUC;
  final GetPacienteByIdUC _getPacienteByIdUC;
//-----------------------------------------------------RX--------------------------------------------------------
  final form = PacienteUpdateFormModel.initial().obs;

  Rx<DateTime> selectDate = DateTime(1900, 1, 1).obs;
  DateTime firstday = DateTime(1900);
  DateTime lastDate = DateTime(2025);

  RxList<ContenedorModel> contenedorTipoGenero = <ContenedorModel>[].obs;
  RxList<ContenedorModel> contenedorTipoDocumento = <ContenedorModel>[].obs;
  RxList<ContenedorModel> contenedorTipoOcupacion = <ContenedorModel>[].obs;

  Rx<ProgressState> loginIconState = ProgressState.oculto.obs;
//-----------------------------------------------------RX FIN---------------------------------------------------------
  PacienteUpdateController(
    this._updatePacienteUC,
    this._getPacienteByIdUC,
  );
  final nombresCtrl = TextEditingController();
  final apPaternoCtrl = TextEditingController();
  final apMaternoCtrl = TextEditingController();
  final fechaNacimientoCtrl = TextEditingController();
  final numDocCtrl = TextEditingController();
  final celularCtrl = TextEditingController();
  final domicilioCtrl = TextEditingController();
  final lugarProcedenciaCtrl = TextEditingController();
  final enfermedadActualCtrl = TextEditingController();
  final antecedentesCtrl = TextEditingController();
  final motivoConsultaCtrl = TextEditingController();
  final correoCtrl = TextEditingController();

  Rx<ContenedorModel>? generoInit;
  Rx<ContenedorModel>? ocupacionInit;
  Rx<ContenedorModel>? tipoDocInit;

  @override
  void onReady() async {
    super.onReady();
    loginIconState(ProgressState.visible);
    await _getTipoGeneros();
    await _getTipoDocumento();
    await _getTipoOcupacion();
    int id = Get.arguments as int;

    final result = await _getPacienteByIdUC.call(id);
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
        if (response != null) {
          nombresCtrl.text = response.nombres;
          apPaternoCtrl.text = response.apPaterno;
          apMaternoCtrl.text = response.apMaterno;
          fechaNacimientoCtrl.text = response.fechaNacimiento;
          numDocCtrl.text = response.dni;
          celularCtrl.text = response.celular ?? "";
          correoCtrl.text = response.correo ?? "";
          domicilioCtrl.text = response.domicilio ?? "";
          lugarProcedenciaCtrl.text = response.lugarProcedencia ?? "";
          enfermedadActualCtrl.text = response.enfermedadActual;
          antecedentesCtrl.text = response.antecedentes;
          motivoConsultaCtrl.text = response.motivoConsulta;
          generoInit = contenedorTipoGenero
              .firstWhere((e) => e.id == response.idgenero)
              .obs;
          ocupacionInit = contenedorTipoOcupacion
              .firstWhere((e) => e.id == response.idocupacion)
              .obs;
          tipoDocInit = contenedorTipoDocumento
              .firstWhere((e) => e.id == response.idtipodoc)
              .obs;
          setId(response.id);
          setNombres(response.nombres);
          setApellidoPaterno(response.apPaterno);
          setApellidoMaterno(response.apMaterno);
          setTipoGenero(generoInit?.value);
          setTipoOcupacion(ocupacionInit?.value);
          setFechaNacimiento(
              DateTimeExtensions.toFormatDateTime(response.fechaNacimiento));
          selectDate.value =
              DateTimeExtensions.toFormatDateTime(response.fechaNacimiento);
          setTipoDocumento(tipoDocInit?.value);
          setDni(response.dni);
          setCelular(response.celular ?? "");
          setCorreo(response.correo ?? "");
          setDomicilio(response.domicilio ?? "");
          setLugarProcedencia(response.lugarProcedencia ?? "");
          setEnfermedadActual(response.enfermedadActual);
          setAntecendes(response.antecedentes);
          setMotivoConsulta(response.motivoConsulta);
          setLugarProcedencia(response.lugarProcedencia ?? "");
          loginIconState(ProgressState.oculto);
          update();
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    liberarCarrito();
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
      PacienteUpdateModel pacienteModel = form.value.toEntity();
      updatePaciente(pacienteModel);
    }
  }

  void updatePaciente(PacienteUpdateModel pacienteUpdateModel) async {
    final result = await _updatePacienteUC.call(pacienteUpdateModel);
    result.when(
      left: (systemNotification) {
        DialogController().showDialog002(
            icon: Icons.error_outline_outlined,
            title: systemNotification.titulo,
            mensaje: systemNotification.mensaje,
            twoOptions: false);
      },
      right: (response) {
        CustomSnackbar(
          title: "Paciente Modificado",
          message:
              "${pacienteUpdateModel.nombres}  ${pacienteUpdateModel.apPaterno}",
          seconds: 3,
          icon: Icon(
            Icons.check,
            color: SlgColors.amarillo,
          ),
        );
        _carritoPacienteController.modificarItem(
          0,
          PacienteItemModel(
            id: pacienteUpdateModel.id,
            dni: pacienteUpdateModel.dni,
            denominacion:
                "${pacienteUpdateModel.nombres} ${pacienteUpdateModel.apPaterno} ${pacienteUpdateModel.apMaterno}"
                    .toUpperCase(),
            idgenero: pacienteUpdateModel.idgenero,
            idtipodoc: pacienteUpdateModel.idtipodoc,
            fechaNacimiento: pacienteUpdateModel.fechaNacimiento,
            edad: 0,
            motivoConsulta: pacienteUpdateModel.motivoConsulta,
            enfermedadActual: pacienteUpdateModel.enfermedadActual,
            antecedentes: pacienteUpdateModel.antecedentes,
            ocupacion: "",
            genero: "",
            tipodoc: "",
            tipodocAbrev: contenedorTipoDocumento
                .firstWhere((e) => form.value.idtipodoc == e.id)
                .abrev,
            idocupacion: pacienteUpdateModel.idocupacion,
            is_active: true,
            is_activeText: "ACTIVO",
            correo: pacienteUpdateModel.correo,
            domicilio: pacienteUpdateModel.domicilio,
            celular: pacienteUpdateModel.celular,
          ),
        );
        Get.back();
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

  void liberarCarrito() {
    Get.delete<CarritoController>();
  }

  //-------------------------------------------------------------------------------------------
  // update values form
  void setId(int id) {
    form.update((val) {
      val?.id = id;
    });
  }

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
}
