import 'dart:convert';

List<MaritalStatusModel> maritalStatusModelFromJson(String str) =>
    List<MaritalStatusModel>.from(
        json.decode(str).map((x) => MaritalStatusModel.fromJson(x)));

String maritalStatusModelToJson(List<MaritalStatusModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MaritalStatusModel {
  final int id;
  final String code;
  final String label;
  final dynamic createdAt;
  final dynamic updatedAt;

  MaritalStatusModel({
    required this.id,
    required this.code,
    required this.label,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MaritalStatusModel.fromJson(Map<String, dynamic> json) =>
      MaritalStatusModel(
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
