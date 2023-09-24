// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cita_create_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitaCreateFormModel _$CitaCreateFormModelFromJson(Map<String, dynamic> json) =>
    CitaCreateFormModel(
      fecha: json['fecha'] as String,
      hora: json['hora'] as String,
      iddoctor: json['iddoctor'] as int,
      razon: json['razon'] as String,
      isOcupado: json['isOcupado'] as bool,
      isAsist: json['isAsist'] as bool,
      idsede: json['idsede'] as int,
      idpaciente: json['idpaciente'] as int,
      isCitaRapida: json['isCitaRapida'] as bool,
      citaRapidaNombrePaciente: json['citaRapidaNombrePaciente'] as String?,
      citaRapidaCelular: json['citaRapidaCelular'] as String?,
    );

Map<String, dynamic> _$CitaCreateFormModelToJson(
        CitaCreateFormModel instance) =>
    <String, dynamic>{
      'fecha': instance.fecha,
      'hora': instance.hora,
      'iddoctor': instance.iddoctor,
      'idsede': instance.idsede,
      'idpaciente': instance.idpaciente,
      'razon': instance.razon,
      'isOcupado': instance.isOcupado,
      'isAsist': instance.isAsist,
      'isCitaRapida': instance.isCitaRapida,
      'citaRapidaNombrePaciente': instance.citaRapidaNombrePaciente,
      'citaRapidaCelular': instance.citaRapidaCelular,
    };
