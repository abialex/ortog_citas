class PacienteRequest {
  PacienteRequest(
      {required this.search,
      required this.estado,
      required this.pageIndex,
      required this.pageSize});
  String search;
  bool estado;
  int pageIndex;
  int pageSize;

  factory PacienteRequest.fromJson(Map<String, dynamic> json) =>
      PacienteRequest(
          search: json["search"] as String,
          estado: json["estado"] as bool,
          pageIndex: json["pageIndex"] as int,
          pageSize: json["pageSize"] as int);

  Map<String, dynamic> toJson() => {
        "search": search,
        "estado": estado,
        "pageIndex": pageIndex,
        "pageSize": pageSize
      };
}
