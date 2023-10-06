import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  final int user_id;
  final String title;
  final String message;
  final dynamic data;
  const NotificationModel({
    required this.user_id,
    required this.title,
    required this.message,
    required this.data,
  });

  //fromJson
  factory NotificationModel.fromJson(Map<String, dynamic> map) =>
      _$NotificationModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
