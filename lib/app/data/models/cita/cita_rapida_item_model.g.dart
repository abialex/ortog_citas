// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cita_rapida_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitaRapidaItemModel _$CitaItemFilteredModelFromJson(
        Map<String, dynamic> json) =>
    CitaRapidaItemModel(
      id: json['id'] as int,
      fechaCita: json['fechaCita'] as String,
      hora: json['hora'] as String,
      iddoctor: json['iddoctor'] as int,
      doctor: json['doctor'] as String,
      paciente: json['paciente'] as String?,
      razon: json['razon'] as String,
      idpaciente: json['idpaciente'] as int?,
      citaRapidaNombrePaciente: json['citaRapidaNombrePaciente'] as String?,
      isAsist: json['isAsist'] as bool?,
      isOcupado: json['isOcupado'] as bool,
      isCitaRapida: json['isCitaRapida'] as bool,
      citaRapidaCelular: json['citaRapidaCelular'] as String?,
    );

Map<String, dynamic> _$CitaItemFilteredModelToJson(
        CitaRapidaItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fechaCita': instance.fechaCita,
      'hora': instance.hora,
      'iddoctor': instance.iddoctor,
      'idpaciente': instance.idpaciente,
      'doctor': instance.doctor,
      'paciente': instance.paciente,
      'razon': instance.razon,
      'isOcupado': instance.isOcupado,
      'isAsist': instance.isAsist,
      'isCitaRapida': instance.isCitaRapida,
      'citaRapidaNombrePaciente': instance.citaRapidaNombrePaciente,
      'citaRapidaCelular': instance.citaRapidaCelular,
    };
