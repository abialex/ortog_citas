// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_responsive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsuarioResponsive _$UsuarioResponsiveFromJson(Map<String, dynamic> json) =>
    UsuarioResponsive(
      id: json['id'] as int,
      sessionKey: json['sessionKey'] as String,
      sedes: (json['sedes'] as List<dynamic>)
          .map((e) => SedeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      roles: (json['roles'] as List<dynamic>)
          .map((e) => RolModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      username: json['username'] as String,
      persona: json['persona'] as String?,
    );

Map<String, dynamic> _$UsuarioResponsiveToJson(UsuarioResponsive instance) =>
    <String, dynamic>{
      'username': instance.username,
      'persona': instance.persona,
      'id': instance.id,
      'sessionKey': instance.sessionKey,
      'sedes': instance.sedes,
      'roles': instance.roles,
    };
