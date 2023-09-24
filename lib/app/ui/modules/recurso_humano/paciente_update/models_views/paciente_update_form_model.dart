import 'package:ortog_citas/app/data/models/cita/cita_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../data/models/paciente/paciente_create_model.dart';
import '../../../../../data/models/paciente/paciente_update_model.dart';

part 'paciente_update_form_model.g.dart';

@JsonSerializable()
class PacienteUpdateFormModel {
  int id;
  String dni;
  String nombres;
  String apPaterno;
  String apMaterno;
  int idgenero;
  int idtipodoc;
  int idocupacion;
  String fechaNacimiento;
  String motivoConsulta;
  String? celular;
  String? correo;
  String? domicilio;
  String? lugarProcedencia;
  String enfermedadActual;
  String antecedentes;

  PacienteUpdateFormModel(
      {required this.id,
      required this.dni,
      required this.nombres,
      required this.apPaterno,
      required this.apMaterno,
      required this.idgenero,
      required this.idtipodoc,
      required this.idocupacion,
      required this.fechaNacimiento,
      required this.motivoConsulta,
      this.celular,
      this.correo,
      this.domicilio,
      this.lugarProcedencia,
      required this.enfermedadActual,
      required this.antecedentes});

  factory PacienteUpdateFormModel.fromJson(Map<String, dynamic> map) =>
      _$PacienteUpdateFormModelFromJson(map);

  PacienteUpdateModel toEntity() {
    return PacienteUpdateModel(
        id: id,
        dni: dni,
        nombres: nombres,
        apPaterno: apPaterno,
        apMaterno: apMaterno,
        idgenero: idgenero,
        idtipodoc: idtipodoc,
        idocupacion: idocupacion,
        fechaNacimiento: fechaNacimiento,
        motivoConsulta: motivoConsulta,
        celular: celular,
        correo: correo,
        domicilio: domicilio,
        enfermedadActual: enfermedadActual,
        antecedentes: antecedentes);
  }

  factory PacienteUpdateFormModel.initial() => PacienteUpdateFormModel(
      id: 0,
      dni: "",
      nombres: "",
      apPaterno: "",
      apMaterno: "",
      idgenero: 0,
      idtipodoc: 0,
      idocupacion: 0,
      fechaNacimiento: "",
      motivoConsulta: "",
      celular: "",
      correo: "",
      domicilio: "",
      enfermedadActual: "",
      antecedentes: "");
}
