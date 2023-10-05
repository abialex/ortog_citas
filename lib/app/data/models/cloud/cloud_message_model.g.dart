// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudMessageModel _$CloudMessageModelFromJson(Map<String, dynamic> json) =>
    CloudMessageModel(
      title: json['title'] as String,
      body: json['body'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$CloudMessageModelToJson(CloudMessageModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'data': instance.data,
    };
