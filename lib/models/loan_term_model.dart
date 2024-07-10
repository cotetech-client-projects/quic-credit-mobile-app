import 'dart:convert';

LoanTermModel loanTermModelFromJson(String str) =>
    LoanTermModel.fromJson(json.decode(str));

String loanTermModelToJson(LoanTermModel data) => json.encode(data.toJson());

class LoanTermModel {
  final String message;
  final List<LoanData> data;

  LoanTermModel({
    required this.message,
    required this.data,
  });

  factory LoanTermModel.fromJson(Map<String, dynamic> json) => LoanTermModel(
        message: json["message"],
        data:
            List<LoanData>.from(json["data"].map((x) => LoanData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class LoanData {
  final int id;
  final int daysToPay;
  final DateTime createdAt;
  final DateTime updatedAt;

  LoanData({
    required this.id,
    required this.daysToPay,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LoanData.fromJson(Map<String, dynamic> json) => LoanData(
        id: json["id"],
        daysToPay: json["days_to_pay"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "days_to_pay": daysToPay,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
