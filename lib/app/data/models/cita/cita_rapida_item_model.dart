import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/cita.dart';

part 'cita_rapida_item_model.g.dart';

@JsonSerializable()
class CitaRapidaItemModel {
  final int id;
  final String fechaCita;
  final String hora;
  final int iddoctor;
  final int? idpaciente;
  final String doctor;
  final String? paciente;
  final String razon;
  final bool isOcupado;
  final bool? isAsist;
  final bool isCitaRapida;
  final String? citaRapidaNombrePaciente;
  final String? citaRapidaCelular;

  CitaRapidaItemModel(
      {required this.id,
      required this.fechaCita,
      required this.hora,
      required this.iddoctor,
      required this.doctor,
      this.paciente,
      required this.razon,
      this.idpaciente,
      this.citaRapidaNombrePaciente,
      this.isAsist,
      required this.isOcupado,
      required this.isCitaRapida,
      this.citaRapidaCelular});

  //fromJson
  factory CitaRapidaItemModel.fromJson(Map<String, dynamic> map) =>
      _$CitaRapidaItemModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$CitaRapidaItemModelToJson(this);
}
