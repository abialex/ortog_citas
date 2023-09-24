import 'package:json_annotation/json_annotation.dart';

import '../../../../../data/models/paciente/paciente_create_model.dart';

part 'paciente_create_form_model.g.dart';

@JsonSerializable()
class PacienteCreateFormModel {
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

  PacienteCreateFormModel(
      {required this.dni,
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

  factory PacienteCreateFormModel.fromJson(Map<String, dynamic> map) =>
      _$PacienteCreateFormModelFromJson(map);

  PacienteCreateModel toEntity() {
    return PacienteCreateModel(
        dni: dni,
        nombres: nombres,
        apPaterno: apPaterno,
        apMaterno: apMaterno,
        idgenero: idgenero,
        idtipodoc: idtipodoc,
        fechaNacimiento: fechaNacimiento,
        motivoConsulta: motivoConsulta,
        celular: celular,
        correo: correo,
        domicilio: domicilio,
        enfermedadActual: enfermedadActual,
        antecedentes: antecedentes,
        idocupacion: idocupacion,
        lugarProcedencia: lugarProcedencia);
  }

  factory PacienteCreateFormModel.initial() => PacienteCreateFormModel(
      dni: "",
      nombres: "",
      apPaterno: "",
      apMaterno: "",
      idgenero: 0,
      idtipodoc: 0,
      idocupacion: 0,
      fechaNacimiento: "",
      motivoConsulta: "",
      celular: null,
      correo: null,
      domicilio: null,
      enfermedadActual: "",
      antecedentes: "",
      lugarProcedencia: null);
}
