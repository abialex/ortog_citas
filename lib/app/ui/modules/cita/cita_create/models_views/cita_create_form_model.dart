import 'package:json_annotation/json_annotation.dart';

import '../../../../../data/models/cita/cita_create_model.dart';

part 'cita_create_form_model.g.dart';

@JsonSerializable()
class CitaCreateFormModel {
  String fecha;
  String hora;
  int iddoctor;
  int idsede;
  int idpaciente;
  String razon;
  bool isOcupado;
  bool isAsist;
  bool isCitaRapida;
  String? citaRapidaNombrePaciente;
  String? citaRapidaCelular;

  CitaCreateFormModel(
      {required this.fecha,
      required this.hora,
      required this.iddoctor,
      required this.razon,
      required this.isOcupado,
      required this.isAsist,
      required this.idsede,
      required this.idpaciente,
      required this.isCitaRapida,
      this.citaRapidaNombrePaciente,
      this.citaRapidaCelular});

  factory CitaCreateFormModel.fromJson(Map<String, dynamic> map) =>
      _$CitaCreateFormModelFromJson(map);

  CitaCreateModel toEntityCreateCita() {
    return CitaCreateModel(
      iddoctor: iddoctor,
      isOcupado: isOcupado,
      idpaciente: idpaciente,
      idsede: idsede,
      isAsist: isAsist,
      fechaCita: fecha,
      hora: hora,
      razon: razon,
      isCitaRapida: isCitaRapida,
    );
  }

  CitaCreateModel toEntityCreateCitaOcupada() {
    return CitaCreateModel(
      iddoctor: iddoctor,
      isOcupado: true,
      fechaCita: fecha,
      hora: hora,
      razon: razon,
      isCitaRapida: false,
    );
  }

  CitaCreateModel toEntityCreateCitaRapida() {
    return CitaCreateModel(
        idsede: idsede,
        iddoctor: iddoctor,
        isOcupado: false,
        fechaCita: fecha,
        hora: hora,
        razon: razon,
        isCitaRapida: true,
        citaRapidaNombrePaciente: citaRapidaNombrePaciente,
        citaRapidaCelular: citaRapidaCelular);
  }

  factory CitaCreateFormModel.initial() => CitaCreateFormModel(
        fecha: '',
        hora: '',
        iddoctor: 0,
        idpaciente: 0,
        idsede: 0,
        isAsist: false,
        isOcupado: false,
        razon: '',
        isCitaRapida: false,
      );
}
