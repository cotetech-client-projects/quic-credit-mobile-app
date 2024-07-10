import 'dart:convert';

RepaymentModel repaymentModelFromJson(String str) =>
    RepaymentModel.fromJson(json.decode(str));

String repaymentModelToJson(RepaymentModel data) => json.encode(data.toJson());

class RepaymentModel {
  final String message;
  final List<Datum> data;

  RepaymentModel({
    required this.message,
    required this.data,
  });

  factory RepaymentModel.fromJson(Map<String, dynamic> json) => RepaymentModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final int id;
  final String modeName;
  final DateTime createdAt;
  final DateTime updatedAt;

  Datum({
    required this.id,
    required this.modeName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        modeName: json["mode_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mode_name": modeName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
