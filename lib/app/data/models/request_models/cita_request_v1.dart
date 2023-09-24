class CitaRequestv1Model {
  CitaRequestv1Model({
    required this.search,
    this.isOcupado,
    this.isAsist,
    this.isCitaRapida,
    this.dateInicio,
    this.dateFin,
    this.dateToday,
    this.pageSize,
  });
  String search;
  bool? isOcupado;
  bool? isAsist;
  bool? isCitaRapida;
  String? dateInicio;
  String? dateFin;
  String? dateToday;
  int? pageSize;

  Map<String, dynamic> toJson() => {
        "search": search,
        "isOcupado": isOcupado,
        "isAsist": isAsist,
        "isCitaRapida": isCitaRapida,
        "dateInicio": dateInicio,
        "dateFin": dateFin,
        "dateToday": dateToday,
        "pageSize": pageSize,
      };
}
