import 'dart:convert';

List<RelationshipsModel> relationshipsModelFromJson(String str) =>
    List<RelationshipsModel>.from(
        json.decode(str).map((x) => RelationshipsModel.fromJson(x)));

String relationshipsModelToJson(List<RelationshipsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RelationshipsModel {
  final int id;
  final String name;
  final dynamic createdAt;
  final dynamic updatedAt;

  RelationshipsModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RelationshipsModel.fromJson(Map<String, dynamic> json) =>
      RelationshipsModel(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
