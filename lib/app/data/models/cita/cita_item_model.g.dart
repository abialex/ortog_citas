// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cita_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitaItemModel _$CitaItemModelFromJson(Map<String, dynamic> json) =>
    CitaItemModel(
      idcita: json['idcita'] as int,
      hora: json['hora'] as String,
      denominacion: json['denominacion'] as String?,
      celular: json['celular'] as String?,
      razon: json['razon'] as String?,
      idpaciente: json['idpaciente'] as int?,
      citaRapidaNombrePaciente: json['citaRapidaNombrePaciente'] as String?,
      isCitaRapida: json['isCitaRapida'] as bool,
      citaRapidaCelular: json['citaRapidaCelular'] as String?,
    );

Map<String, dynamic> _$CitaItemModelToJson(CitaItemModel instance) =>
    <String, dynamic>{
      'idcita': instance.idcita,
      'hora': instance.hora,
      'razon': instance.razon,
      'denominacion': instance.denominacion,
      'celular': instance.celular,
      'idpaciente': instance.idpaciente,
      'isCitaRapida': instance.isCitaRapida,
      'citaRapidaNombrePaciente': instance.citaRapidaNombrePaciente,
      'citaRapidaCelular': instance.citaRapidaCelular,
    };
