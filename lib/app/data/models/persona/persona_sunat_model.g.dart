// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persona_sunat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonaSunatModel _$PersonaSunatModelFromJson(Map<String, dynamic> json) =>
    PersonaSunatModel(
      nombres: json['nombres'] as String?,
      apellidoPaterno: json['apellidoPaterno'] as String?,
      apellidoMaterno: json['apellidoMaterno'] as String?,
      numeroDocumento: json['numeroDocumento'] as String?,
    );

Map<String, dynamic> _$PersonaSunatModelToJson(PersonaSunatModel instance) =>
    <String, dynamic>{
      'nombres': instance.nombres,
      'apellidoPaterno': instance.apellidoPaterno,
      'apellidoMaterno': instance.apellidoMaterno,
      'numeroDocumento': instance.numeroDocumento,
    };
