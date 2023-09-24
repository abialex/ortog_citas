import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/cita.dart';
import '../../../domain/entities/usuario.dart';

part 'cita_detalle_model.g.dart';

@JsonSerializable()
class CitaDetalleModel {
  final int id;
  final String fechaCita;
  final String hora;
  final String paciente;
  final int edad;
  final String motivoConsulta;
  final String enfermedadActual;
  final String antecedentes;
  final String razon;
  final bool isAsistActualizado;
  final bool isAsist;
  final String isAsistString;

  CitaDetalleModel({
    required this.id,
    required this.fechaCita,
    required this.hora,
    required this.paciente,
    required this.edad,
    required this.motivoConsulta,
    required this.enfermedadActual,
    required this.antecedentes,
    required this.razon,
    required this.isAsistActualizado,
    required this.isAsist,
    required this.isAsistString,
  });

  //fromJson
  factory CitaDetalleModel.fromJson(Map<String, dynamic> map) =>
      _$CitaDetalleModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$CitaDetalleModelToJson(this);
}
