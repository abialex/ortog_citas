import 'package:json_annotation/json_annotation.dart';

part 'persona_sunat_model.g.dart';

@JsonSerializable()
class PersonaSunatModel {
  final String? nombres;
  final String? apellidoPaterno;
  final String? apellidoMaterno;
  final String? numeroDocumento;
  const PersonaSunatModel(
      {this.nombres,
      this.apellidoPaterno,
      this.apellidoMaterno,
      this.numeroDocumento});

  //fromJson
  factory PersonaSunatModel.fromJson(Map<String, dynamic> map) =>
      _$PersonaSunatModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$PersonaSunatModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  String toString() {
    // TODO: implement toString
    return nombres ?? "Nn";
  }
}
