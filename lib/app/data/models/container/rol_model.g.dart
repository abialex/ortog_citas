// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rol_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RolModel _$RolModelFromJson(Map<String, dynamic> json) => RolModel(
      json['id'] as int,
      json['idrol'] as int,
      json['nombreRol'] as String,
      json['prioridad'] as int,
    );

Map<String, dynamic> _$RolModelToJson(RolModel instance) => <String, dynamic>{
      'id': instance.id,
      'idrol': instance.idrol,
      'nombreRol': instance.nombreRol,
      'prioridad': instance.prioridad,
    };
