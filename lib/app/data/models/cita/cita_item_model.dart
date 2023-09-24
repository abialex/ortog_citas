import 'package:ortog_citas/app/domain/entities/persona.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/cita.dart';
import '../../../domain/entities/usuario.dart';

part 'cita_item_model.g.dart';

@JsonSerializable()
class CitaItemModel extends Cita {
  final String? denominacion;
  final String? celular;
  final int? idpaciente;

  final bool isCitaRapida;
  final String? citaRapidaNombrePaciente;
  final String? citaRapidaCelular;

  CitaItemModel(
      {required int idcita,
      required String hora,
      this.denominacion,
      this.celular,
      String? razon,
      this.idpaciente,
      this.citaRapidaNombrePaciente,
      required this.isCitaRapida,
      this.citaRapidaCelular})
      : super(
          idcita: idcita,
          hora: hora,
          razon: razon,
        );

  //fromJson
  factory CitaItemModel.fromJson(Map<String, dynamic> map) =>
      _$CitaItemModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$CitaItemModelToJson(this);
}
