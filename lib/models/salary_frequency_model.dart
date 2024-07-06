import 'dart:convert';

List<SalaryFrequencyModel> salaryFrequencyModelFromJson(String str) =>
    List<SalaryFrequencyModel>.from(
        json.decode(str).map((x) => SalaryFrequencyModel.fromJson(x)));

String salaryFrequencyModelToJson(List<SalaryFrequencyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SalaryFrequencyModel {
  final int id;
  final String code;
  final String label;
  final dynamic createdAt;
  final dynamic updatedAt;

  SalaryFrequencyModel({
    required this.id,
    required this.code,
    required this.label,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SalaryFrequencyModel.fromJson(Map<String, dynamic> json) =>
      SalaryFrequencyModel(
        id: json["id"],
        code: json["code"],
        label: json["label"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "label": label,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
