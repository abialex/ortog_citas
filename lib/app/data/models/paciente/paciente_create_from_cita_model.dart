import 'package:json_annotation/json_annotation.dart';

part 'paciente_create_from_cita_model.g.dart';

@JsonSerializable()
class PacienteCreateFromCitaModel {
  final String dni;
  final String nombres;
  final String apPaterno;
  final String apMaterno;
  final int idgenero;
  final int idtipodoc;
  final int idocupacion;
  final String fechaNacimiento;
  final String motivoConsulta;
  final String? celular;
  final String? correo;
  final String? domicilio;
  final String? lugarProcedencia;
  final String enfermedadActual;
  final String antecedentes;
  final int idcita;
  final bool isCitaRapida;

  const PacienteCreateFromCitaModel(
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
      this.lugarProcedencia,
      this.domicilio,
      required this.enfermedadActual,
      required this.antecedentes,
      required this.idcita,
      required this.isCitaRapida});

  //fromJson
  factory PacienteCreateFromCitaModel.fromJson(Map<String, dynamic> map) =>
      _$PacienteCreateFromCitaModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$PacienteCreateFromCitaModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  String toString() {
    // TODO: implement toString
    return nombres;
  }
}
