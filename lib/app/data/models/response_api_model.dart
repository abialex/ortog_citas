import 'package:json_annotation/json_annotation.dart';

import '../../domain/response_class/response_api.dart';

part 'response_api_model.g.dart';

@JsonSerializable()
class ResponseApiModel extends ResponseApi {
  const ResponseApiModel(
      {required int status,
      required String type,
      required String title,
      required bool success,
      String? detail,
      dynamic? invalidParams,
      List<String>? messages,
      required dynamic result})
      : super(
          status: status,
          type: type,
          title: title,
          success: success,
          detail: detail,
          invalidParams: invalidParams,
          messages: messages,
          result: result,
        );

  //fromJson
  factory ResponseApiModel.fromJson(Map<String, dynamic> map) =>
      _$ResponseApiModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$ResponseApiModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
