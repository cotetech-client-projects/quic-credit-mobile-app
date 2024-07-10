import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:quic_credit/models/loan_term_model.dart';
import 'package:quic_credit/models/repayment_model.dart';
import 'package:quic_credit/models/user_loan_request_model.dart';

import '../exports/exports.dart';

class LoanService {
  static const platform = MethodChannel('com.app.quic_credit/loanEligibility');

  Future<void> checkLoanEligibility() async {
    String loanAmount = "";
    try {
      final double result = await platform
          .invokeMethod('checkLoanEligibility', {"userId": 12345});
      loanAmount = 'Loan amount: \$${result.toStringAsFixed(2)}';
      if (kDebugMode) {
        print(loanAmount);
      }
    } on PlatformException catch (e) {
      loanAmount = "Failed to get loan amount: '${e.message}'.";
    }
    //
    applyForLoan(Map<String, dynamic> data) async {
      try {
        var headers = {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${authenticatedUser.user?.accessToken}'
        };
        var request = Request(
          'POST',
          Uri.parse(Apis.loanRequest),
        );
        request.body =
            json.encode({"user_id": authenticatedUser.user?.user.id, ...data});
        request.headers.addAll(headers);

        StreamedResponse response = await request.send();

        if (response.statusCode == 200 || response.statusCode == 201) {
          return Future.error(await response.stream.bytesToString());
        } else {
          return Future.error(
              response.reasonPhrase ?? "Invalid details provided");
        }
      } on Exception catch (e) {
        return Future.error(e.toString());
      }
    }
  }

  // loan repayment
  Future<List<Datum>> loanRepaymentModel() async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authenticatedUser.user?.accessToken}',
      };
      var request = Request(
        'GET',
        Uri.parse(
          Apis.loanRepaymentModes,
        ),
      );
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return repaymentModelFromJson(await response.stream.bytesToString())
            .data;
      } else {
        return Future.error(response.reasonPhrase!);
      }
    } on Exception catch (e) {
      return Future.error(
        e.toString(),
      );
    }
  }

//  loan term period
  Future<List<LoanData>> loanTermPeriod() async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authenticatedUser.user?.accessToken}'
      };
      var request = Request('GET', Uri.parse(Apis.loanTerm));
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        Client().close();
        return loanTermModelFromJson(await response.stream.bytesToString())
            .data;
      } else {
        Client().close();
        return Future.error(response.reasonPhrase ?? "");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

// apply for loan
  Future<String> applyLoan(Map<String, dynamic> data) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authenticatedUser.user?.accessToken}'
      };
      var request = Request('POST', Uri.parse(Apis.loanRequest));
      request.body = json.encode({
        "user_id": authenticatedUser.user?.user.id,
        ...data,
      });
      request.headers.addAll(headers);

      StreamedResponse response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Future.value("Loan Request sent successfully");
      } else {
        return Future.error(
          response.reasonPhrase ?? "Invalid details provided",
        );
      }
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

// user loan request
  Future<List<UserLoanRequestModel>> userLoanRequest() async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authenticatedUser.user?.accessToken}'
      };
      var request = Request(
        'GET',
        Uri.parse(
          "${Apis.userLoanRequest}${authenticatedUser.user?.user.id}",
        ),
      );
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return userLoanRequestModelFromJson(
            await response.stream.bytesToString());
      } else {
        return Future.error(response.reasonPhrase ?? "");
      }
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }
}
