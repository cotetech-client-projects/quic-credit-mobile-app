import 'dart:convert';

List<WorkStatusModel> workStatusModelFromJson(String str) =>
    List<WorkStatusModel>.from(
        json.decode(str).map((x) => WorkStatusModel.fromJson(x)));

String workStatusModelToJson(List<WorkStatusModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorkStatusModel {
  final int id;
  final String code;
  final String label;
  final dynamic createdAt;
  final dynamic updatedAt;

  WorkStatusModel({
    required this.id,
    required this.code,
    required this.label,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WorkStatusModel.fromJson(Map<String, dynamic> json) =>
      WorkStatusModel(
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
