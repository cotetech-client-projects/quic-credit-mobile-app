import 'dart:convert';

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
      if (response.statusCode == 200) {
        return Future.value(
          await response.stream.bytesToString(),
        );
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
      if (response.statusCode == 200) {
        return Future.value(
          await response.stream.bytesToString(),
        );
      } else {
        Future.error(response.reasonPhrase ?? "");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
    throw Exception(
        'Unexpected error occurred.'); // Add a throw statement at the end of the try block
  }
}
