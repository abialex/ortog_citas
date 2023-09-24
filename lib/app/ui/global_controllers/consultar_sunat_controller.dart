import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/persona/persona_sunat_model.dart';
import '../../domain/repository/ipersona_repository.dart';
import 'dialog_controller.dart';

class ConsultaSunatController extends GetxController {
  //controlador directo repository
  final IPersonaRepository _personaRepository = Get.find<IPersonaRepository>();

  //desde el injection
  String numeroDocumento = "";

  Future<PersonaSunatModel?> consultarNumeroDocumento() async {
    //funcion recuperar datos
    final result =
        await _personaRepository.getPersonaSunatByDni(numeroDocumento);
    PersonaSunatModel? personaSunResult;
    result.when(left: (systemNotification) {
      DialogController().showDialog001(
          icon: Icons.person_off,
          title: systemNotification.titulo,
          mensaje: systemNotification.mensaje,
          twoOptions: false);
    }, right: (response) {
      if (response == null) {
        DialogController().showDialog001(
          icon: Icons.person_off,
          title: "No se encontró",
          mensaje: "Llene manualmente los datos",
          twoOptions: false,
        );
      }
      personaSunResult = response;
    });
    return personaSunResult;
  }

  setSearch(String value) {
    numeroDocumento = value;
  }
}
