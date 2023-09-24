import 'package:json_annotation/json_annotation.dart';

part 'sede_model.g.dart';

@JsonSerializable()
class SedeModel {
  const SedeModel(
    this.id,
    this.idsede,
    this.nombreSede,
  ) : super();

  final int id;
  final int idsede;
  final String nombreSede;

  //fromJson
  factory SedeModel.fromJson(Map<String, dynamic> map) =>
      _$SedeModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$SedeModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  String toString() {
    // TODO: implement toString
    return nombreSede;
  }
}
