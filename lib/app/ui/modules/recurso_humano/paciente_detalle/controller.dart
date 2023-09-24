import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/paciente/paciente_model.dart';
import '../../../../domain/usecases/paciente/get_byid_paciente.dart';
import '../../../global_controllers/dialog_controller.dart';

enum ProgressState { oculto, visible }

class PacienteDetalleController extends GetxController {
//-----------------------------------------------------RX---------------------------------------------------------
  final GetPacienteByIdUC _getPacienteByIdUC;
//-----------------------------------------------------RX--------------------------------------------------------
  Rx<ProgressState> loginIconState = ProgressState.oculto.obs;

//-----------------------------------------------------RX FIN---------------------------------------------------------
  PacienteDetalleController(
    this._getPacienteByIdUC,
  );
  final nombresCtrl = TextEditingController();
  final apPaternoCtrl = TextEditingController();
  final apMaternoCtrl = TextEditingController();
  final fechaNacimientoCtrl = TextEditingController();
  final edadCtrl = TextEditingController();
  final numDocCtrl = TextEditingController();
  final celularCtrl = TextEditingController();
  final domicilioCtrl = TextEditingController();
  final lugarProcedenciaCtrl = TextEditingController();
  final enfermedadActualCtrl = TextEditingController();
  final antecedentesCtrl = TextEditingController();
  final motivoConsultaCtrl = TextEditingController();
  final correoCtrl = TextEditingController();
  final generoCtrl = TextEditingController();
  final ocupacionCtrl = TextEditingController();
  final tipoDocumentoCtrl = TextEditingController();
  @override
  void onReady() async {
    super.onReady();
    loginIconState(ProgressState.visible);

    final result = await _getPacienteByIdUC.call((Get.arguments as int));
    result.when(
      left: (systemNotification) {
        DialogController().showDialog001(
          icon: Icons.error_outline_outlined,
          title: systemNotification.titulo,
          mensaje: systemNotification.mensaje,
        );
      },
      right: (response) {
        if (response != null) {
          nombresCtrl.text = response.nombres;
          apPaternoCtrl.text = response.apPaterno;
          apMaternoCtrl.text = response.apMaterno;
          fechaNacimientoCtrl.text = response.fechaNacimiento;
          edadCtrl.text = response.edad.toString();
          numDocCtrl.text = response.dni;
          celularCtrl.text = response.celular ?? "";
          correoCtrl.text = response.correo ?? "";
          domicilioCtrl.text = response.domicilio ?? "";
          lugarProcedenciaCtrl.text = response.lugarProcedencia ?? "";
          enfermedadActualCtrl.text = response.enfermedadActual;
          antecedentesCtrl.text = response.antecedentes;
          motivoConsultaCtrl.text = response.motivoConsulta;
          generoCtrl.text = response.genero;
          ocupacionCtrl.text = response.ocupacion;
          tipoDocumentoCtrl.text = response.tipodoc;
          update();
        }
      },
    );
    loginIconState(ProgressState.oculto);
  }

  @override
  void dispose() {
    super.dispose();
  }

  //-----------------------------------------------------
//methods

  //-------------------------------------------------------------------------------------------
  // update values form

  //-------------------------------------------------------------------------------------------
  //validators
}
