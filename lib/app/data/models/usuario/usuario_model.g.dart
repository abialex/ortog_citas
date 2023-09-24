// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsuarioModel _$UsuarioModelFromJson(Map<String, dynamic> json) => UsuarioModel(
      json['id'] as int,
      username: json['username'] as String,
      persona: json['persona'] as String,
    );

Map<String, dynamic> _$UsuarioModelToJson(UsuarioModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'persona': instance.persona,
      'id': instance.id,
    };
