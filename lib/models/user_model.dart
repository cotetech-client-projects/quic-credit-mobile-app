import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String message;
  final String accessToken;
  final String tokenType;
  final User user;

  UserModel({
    required this.message,
    required this.accessToken,
    required this.tokenType,
    required this.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "access_token": accessToken,
        "token_type": tokenType,
        "user": user.toJson(),
      };
}

class User {
  final int id;
  final int roleId;
  final String firstName;
  final String lastName;
  final String middleName;
  final String contact;
  final String alternativeContact;
  final String email;
  final dynamic emailVerifiedAt;
  final dynamic contactVerifiedAt;
  final dynamic alternativeContactVerifiedAt;
  final dynamic lastSeenAt;
  final String invitedByCode;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.roleId,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.contact,
    required this.alternativeContact,
    required this.email,
    required this.emailVerifiedAt,
    required this.contactVerifiedAt,
    required this.alternativeContactVerifiedAt,
    required this.lastSeenAt,
    required this.invitedByCode,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        roleId: json["role_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        middleName: json["middle_name"],
        contact: json["contact"],
        alternativeContact: json["alternative_contact"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        contactVerifiedAt: json["contact_verified_at"],
        alternativeContactVerifiedAt: json["alternative_contact_verified_at"],
        lastSeenAt: json["last_seen_at"],
        invitedByCode: json["invited_by_code"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "first_name": firstName,
        "last_name": lastName,
        "middle_name": middleName,
        "contact": contact,
        "alternative_contact": alternativeContact,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "contact_verified_at": contactVerifiedAt,
        "alternative_contact_verified_at": alternativeContactVerifiedAt,
        "last_seen_at": lastSeenAt,
        "invited_by_code": invitedByCode,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
