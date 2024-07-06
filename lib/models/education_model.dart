import 'dart:convert';

List<EducationModel> educationModelFromJson(String str) =>
    List<EducationModel>.from(
        json.decode(str).map((x) => EducationModel.fromJson(x)));

String educationModelToJson(List<EducationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EducationModel {
  final int id;
  final String code;
  final String label;
  final dynamic createdAt;
  final dynamic updatedAt;

  EducationModel({
    required this.id,
    required this.code,
    required this.label,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EducationModel.fromJson(Map<String, dynamic> json) => EducationModel(
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
