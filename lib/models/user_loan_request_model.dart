import 'dart:convert';

List<UserLoanRequestModel> userLoanRequestModelFromJson(String str) =>
    List<UserLoanRequestModel>.from(
        json.decode(str).map((x) => UserLoanRequestModel.fromJson(x)));

String userLoanRequestModelToJson(List<UserLoanRequestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserLoanRequestModel {
  final int id;
  final int userId;
  final int loanTermId;
  final int loanRepaymentModeId;
  final int amountRequested;
  final int amountGiven;
  final int appreciationPercentage;
  final int isApproved;
  final int isDisbursed;
  final dynamic approvedAt;
  final dynamic disbursedAt;
  final int isRejected;
  final dynamic rejectedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;
  final Loan loanTerm;
  final Loan loanRepaymentMode;

  UserLoanRequestModel({
    required this.id,
    required this.userId,
    required this.loanTermId,
    required this.loanRepaymentModeId,
    required this.amountRequested,
    required this.amountGiven,
    required this.appreciationPercentage,
    required this.isApproved,
    required this.isDisbursed,
    required this.approvedAt,
    required this.disbursedAt,
    required this.isRejected,
    required this.rejectedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.loanTerm,
    required this.loanRepaymentMode,
  });

  factory UserLoanRequestModel.fromJson(Map<String, dynamic> json) =>
      UserLoanRequestModel(
        id: json["id"],
        userId: json["user_id"],
        loanTermId: json["loan_term_id"],
        loanRepaymentModeId: json["loan_repayment_mode_id"],
        amountRequested: json["amount_requested"],
        amountGiven: json["amount_given"],
        appreciationPercentage: json["appreciation_percentage"],
        isApproved: json["is_approved"],
        isDisbursed: json["is_disbursed"],
        approvedAt: json["approved_at"],
        disbursedAt: json["disbursed_at"],
        isRejected: json["is_rejected"],
        rejectedAt: json["rejected_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
        loanTerm: Loan.fromJson(json["loan_term"]),
        loanRepaymentMode: Loan.fromJson(json["loan_repayment_mode"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "loan_term_id": loanTermId,
        "loan_repayment_mode_id": loanRepaymentModeId,
        "amount_requested": amountRequested,
        "amount_given": amountGiven,
        "appreciation_percentage": appreciationPercentage,
        "is_approved": isApproved,
        "is_disbursed": isDisbursed,
        "approved_at": approvedAt,
        "disbursed_at": disbursedAt,
        "is_rejected": isRejected,
        "rejected_at": rejectedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
        "loan_term": loanTerm.toJson(),
        "loan_repayment_mode": loanRepaymentMode.toJson(),
      };
}

class Loan {
  final int id;
  final String modeName;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int daysToPay;

  Loan({
    required this.id,
    required this.modeName,
    required this.createdAt,
    required this.updatedAt,
    required this.daysToPay,
  });

  factory Loan.fromJson(Map<String, dynamic> json) => Loan(
        id: json["id"],
        modeName: json["mode_name"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        daysToPay: json["days_to_pay"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mode_name": modeName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "days_to_pay": daysToPay,
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
  final String invitationCode;
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
    required this.invitationCode,
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
        invitationCode: json["invitation_code"],
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
        "invitation_code": invitationCode,
        "invited_by_code": invitedByCode,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
