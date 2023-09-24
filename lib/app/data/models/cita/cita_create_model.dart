import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/cita.dart';
part 'cita_create_model.g.dart';

@JsonSerializable()
class CitaCreateModel extends Cita {
  final int? idcita;
  final int? idpaciente;
  final String fechaCita;
  final int iddoctor;
  final bool isOcupado;
  final bool? isAsist;
  final int? idsede;
  final bool isCitaRapida;
  final String? citaRapidaNombrePaciente;
  final String? citaRapidaCelular;
  CitaCreateModel(
      {this.idcita,
      this.idpaciente,
      required this.fechaCita,
      required String hora,
      required this.iddoctor,
      String? razon,
      required this.isOcupado,
      this.isAsist,
      this.idsede,
      required this.isCitaRapida,
      this.citaRapidaCelular,
      this.citaRapidaNombrePaciente})
      : super(
          idcita: idcita,
          hora: hora,
          razon: razon,
        );

  //fromJson
  factory CitaCreateModel.fromJson(Map<String, dynamic> map) =>
      _$CitaCreateModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$CitaCreateModelToJson(this);
}
