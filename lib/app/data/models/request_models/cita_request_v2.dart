class CitaRequestv2Model {
  CitaRequestv2Model({
    required this.iddoctor,
    required this.date,
  });
  int iddoctor;
  String date;

  factory CitaRequestv2Model.fromJson(Map<String, dynamic> json) =>
      CitaRequestv2Model(
        iddoctor: json["iddoctor"] as int,
        date: json["date"] as String,
      );

  Map<String, dynamic> toJson() => {
        "iddoctor": iddoctor,
        "date": date,
      };
}
