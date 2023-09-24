import 'package:ortog_citas/app/domain/entities/doctor.dart';
import 'package:ortog_citas/app/domain/entities/paciente.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paciente_create_model.g.dart';

@JsonSerializable()
class PacienteCreateModel {
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

  const PacienteCreateModel(
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
      required this.antecedentes});

  //fromJson
  factory PacienteCreateModel.fromJson(Map<String, dynamic> map) =>
      _$PacienteCreateModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$PacienteCreateModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  String toString() {
    // TODO: implement toString
    return nombres;
  }
}
