import 'dart:convert';

List<RegionsModel> regionsModelFromJson(String str) => List<RegionsModel>.from(
    json.decode(str).map((x) => RegionsModel.fromJson(x)));

String regionsModelToJson(List<RegionsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RegionsModel {
  final int id;
  final String code;
  final String label;
  final dynamic createdAt;
  final dynamic updatedAt;

  RegionsModel({
    required this.id,
    required this.code,
    required this.label,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RegionsModel.fromJson(Map<String, dynamic> json) => RegionsModel(
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
