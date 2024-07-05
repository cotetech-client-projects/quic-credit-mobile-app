import 'dart:convert';
import 'dart:developer';

import 'package:quic_credit/models/user_model.dart';

import '../models/authenticated_user.dart';
import '/exports/exports.dart';

class AuthService {
  // function to handle login
  Future<String> login(Map<String, dynamic> data) async {
    // make a post request to the login endpoint
    // with the email and password
    // return the response
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = Request(
        'POST',
        Uri.parse(Apis.login),
      );
      request.body = json.encode(data);
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        String? result = await response.stream.bytesToString();
        StorageService().setData("user", result);
        return json.decode(result)['message'];
      } else {
        Future.error(response.reasonPhrase ?? "");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
    throw Exception(
        'Unexpected error occurred.'); // Add a throw statement at the end of the try block
  }

  // function to handle registration
  Future<String> register(Map<String, dynamic> data) async {
    // make a post request to the register endpoint
    // with the email and password
    // return the response
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = Request(
        'POST',
        Uri.parse(Apis.register),
      );
      request.body = json.encode(data);
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        Client().close();
        String? result = await response.stream.bytesToString();
        return json.decode(result)['message'];
      } else {
        Future.error(response.reasonPhrase ?? "");
      }
    } catch (e) {
      return Future.error(
        e.toString(),
      );
    }
    throw Exception(
        'Unexpected error occurred.'); // Add a throw statement at the end of the try block
  }

  // logout function
  Future<void> logout() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authenticatedUser.user?.accessToken ?? ""}'
      };
      var request = Request('POST', Uri.parse(Apis.logout));

      request.headers.addAll(headers);
      showLoadingDialog(text: "Logging out...");
      StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        Routes.popPage();
        (await response.stream.bytesToString());
        StorageService().removeData("user");
        Routes.replacePage(
          const LoginScreen(),
        );
        showMessage("Logout successful", color: Colors.green);
      } else {
        log(response.reasonPhrase ?? "");
        showMessage(
          response.reasonPhrase ?? "An error occurred",
          color: Colors.red,
        );
      }
    } catch (e) {
      (e);
      showMessage(
        e.toString(),
        color: Colors.red,
      );
      Routes.popPage();
    }
  }
}
