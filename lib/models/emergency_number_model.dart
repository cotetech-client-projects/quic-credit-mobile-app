
import 'dart:convert';

List<EmergencyNumberModel> emergencyNumberModelFromJson(String str) =>
    List<EmergencyNumberModel>.from(
        json.decode(str).map((x) => EmergencyNumberModel.fromJson(x)));

String emergencyNumberModelToJson(List<EmergencyNumberModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmergencyNumberModel {
  final int id;
  final String name;
  final String description;
  final dynamic createdAt;
  final dynamic updatedAt;

  EmergencyNumberModel({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EmergencyNumberModel.fromJson(Map<String, dynamic> json) =>
      EmergencyNumberModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
