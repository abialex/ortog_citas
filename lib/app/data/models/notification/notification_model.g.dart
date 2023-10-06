// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      user_id: json['user_id'] as int,
      title: json['title'] as String,
      message: json['message'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
