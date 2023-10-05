import 'package:json_annotation/json_annotation.dart';

part 'cloud_message_model.g.dart';

@JsonSerializable()
class CloudMessageModel {
  final String title;
  final String body;
  final dynamic data;
  const CloudMessageModel({
    required this.title,
    required this.body,
    required this.data,
  });

  //fromJson
  factory CloudMessageModel.fromJson(Map<String, dynamic> map) =>
      _$CloudMessageModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$CloudMessageModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
