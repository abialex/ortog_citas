import 'cita_item_model.dart';

class HoraModel {
  HoraModel({
    required this.hora,
    required this.horaString,
    required this.isOcupado,
    required this.isLibre,
    required this.sede,
    this.idsede,
    this.razon,
    required this.listCitas,
  });
  int hora;
  String horaString;
  bool isOcupado;
  bool isLibre;
  String sede;
  int? idsede;
  String? razon;

  List<CitaItemModel> listCitas;

  factory HoraModel.fromJson(Map<String, dynamic> json) => HoraModel(
        hora: json["hora"] as int,
        horaString: json["horaString"] as String,
        isOcupado: json["isOcupado"] as bool,
        isLibre: json["isLibre"] as bool,
        sede: json["sede"] as String,
        idsede: json["idsede"] as int?,
        razon: json["razon"] as String?,
        listCitas: (json["listCitas"] as List<dynamic>)
            .map((e) => CitaItemModel.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "hora": hora,
        "horaString": horaString,
        "isOcupado": isOcupado,
        "isLibre": isLibre,
        "sede": sede,
        "idsede": idsede,
        "razon": razon,
        "listCitas": listCitas,
      };
}
