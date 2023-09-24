// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cita_create_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitaCreateModel _$CitaCreateModelFromJson(Map<String, dynamic> json) =>
    CitaCreateModel(
      idcita: json['idcita'] as int?,
      idpaciente: json['idpaciente'] as int?,
      fechaCita: json['fechaCita'] as String,
      hora: json['hora'] as String,
      iddoctor: json['iddoctor'] as int,
      razon: json['razon'] as String?,
      isOcupado: json['isOcupado'] as bool,
      isAsist: json['isAsist'] as bool?,
      idsede: json['idsede'] as int?,
      isCitaRapida: json['isCitaRapida'] as bool,
      citaRapidaCelular: json['citaRapidaCelular'] as String?,
      citaRapidaNombrePaciente: json['citaRapidaNombrePaciente'] as String?,
    );

Map<String, dynamic> _$CitaCreateModelToJson(CitaCreateModel instance) =>
    <String, dynamic>{
      'hora': instance.hora,
      'razon': instance.razon,
      'idcita': instance.idcita,
      'idpaciente': instance.idpaciente,
      'fechaCita': instance.fechaCita,
      'iddoctor': instance.iddoctor,
      'isOcupado': instance.isOcupado,
      'isAsist': instance.isAsist,
      'idsede': instance.idsede,
      'isCitaRapida': instance.isCitaRapida,
      'citaRapidaNombrePaciente': instance.citaRapidaNombrePaciente,
      'citaRapidaCelular': instance.citaRapidaCelular,
    };
