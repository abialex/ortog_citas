// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token_firebase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTokenFirebaseModel _$UserTokenFirebaseModelFromJson(
        Map<String, dynamic> json) =>
    UserTokenFirebaseModel(
      idusuario: json['idusuario'] as int,
      username: json['username'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$UserTokenFirebaseModelToJson(
        UserTokenFirebaseModel instance) =>
    <String, dynamic>{
      'idusuario': instance.idusuario,
      'username': instance.username,
      'token': instance.token,
    };
