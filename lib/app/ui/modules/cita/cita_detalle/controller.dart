import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/cita/cita_detalle_model.dart';
import '../../../../domain/usecases/cita/get_byid_cita.dart';
import '../../../global_controllers/dialog_controller.dart';

enum ProgressState { oculto, visible }

class CitaDetalleController extends GetxController {
//-----------------------------------------------------RX---------------------------------------------------------
  final GetCitaByIdUC _getCitaByIdUC;
//-----------------------------------------------------RX--------------------------------------------------------
  Rx<ProgressState> loginIconState = ProgressState.oculto.obs;

//-----------------------------------------------------RX FIN---------------------------------------------------------
  CitaDetalleController(
    this._getCitaByIdUC,
  );
  final fechaCitaCtrl = TextEditingController();
  final horaCtrl = TextEditingController();
  final pacienteCtrl = TextEditingController();
  final fechaNacimientoCtrl = TextEditingController();
  final edadCtrl = TextEditingController();
  final razonCtrl = TextEditingController();
  final celularCtrl = TextEditingController();
  final domicilioCtrl = TextEditingController();
  final lugarProcedenciaCtrl = TextEditingController();
  final enfermedadActualCtrl = TextEditingController();
  final antecedentesCtrl = TextEditingController();
  final motivoConsultaCtrl = TextEditingController();
  final correoCtrl = TextEditingController();
  final generoCtrl = TextEditingController();
  final antecendentesCtrl = TextEditingController();
  final tipoDocumentoCtrl = TextEditingController();
  @override
  void onReady() async {
    super.onReady();
    loginIconState(ProgressState.visible);
    late CitaDetalleModel citaDetalleModel;

    final result = await _getCitaByIdUC.call((Get.arguments as int));
    result.when(left: (systemNotification) {
      DialogController().showDialog001(
          icon: Icons.error_outline_outlined,
          title: systemNotification.titulo,
          mensaje: systemNotification.mensaje,
          twoOptions: false);
    }, right: (response) {
      citaDetalleModel = response;
      fechaCitaCtrl.text = citaDetalleModel.fechaCita;
      horaCtrl.text = citaDetalleModel.hora;
      pacienteCtrl.text = citaDetalleModel.paciente;
      motivoConsultaCtrl.text = citaDetalleModel.motivoConsulta;
      edadCtrl.text = citaDetalleModel.edad.toString();
      razonCtrl.text = citaDetalleModel.razon;
      enfermedadActualCtrl.text = citaDetalleModel.enfermedadActual;
      antecedentesCtrl.text = citaDetalleModel.antecedentes;
      // generoCtrl.text = citaDetalleModel.genero;
      antecendentesCtrl.text = citaDetalleModel.antecedentes;
      update();
    });
    loginIconState(ProgressState.oculto);
  }

  @override
  void dispose() {
    super.dispose();
    fechaCitaCtrl.dispose();
    horaCtrl.dispose();
    pacienteCtrl.dispose();
    motivoConsultaCtrl.dispose();
    edadCtrl.dispose();
    razonCtrl.dispose();
    enfermedadActualCtrl.dispose();
    antecedentesCtrl.dispose();
    // generoCtrl.text = citaDetalleModel.genero;
    antecendentesCtrl.dispose();
  }

  //-----------------------------------------------------
//methods

  //-------------------------------------------------------------------------------------------
  // update values form

  //-------------------------------------------------------------------------------------------
  //validators
}
