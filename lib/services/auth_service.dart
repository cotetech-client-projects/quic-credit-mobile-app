import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';

import '../models/emergency_number_model.dart';
import '/models/marital_status_model.dart';
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
        // record session
        SessionService().storeToken(json.decode(result)['access_token']);
        return json.decode(result)['message'];
      } else {
        Future.error("Invalid Details");
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

// personal data
  Future<String> completeAuth(Map<String, dynamic> data) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authenticatedUser.user?.accessToken}'
      };
      var request = Request('POST', Uri.parse(Apis.completeAuth));
      request.body = json.encode({
        "user_id": authenticatedUser.user?.user.id,
        ...data,
      });
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        // String? res = (await response.stream.bytesToString());
        return Future.value("User profile added successfully");
      } else {
        Client().close();
        log(response.statusCode.toString());
        String d = await response.stream.bytesToString();
        var res = json.decode(d);

        return d.contains('error')
            ? Future.error(res['error'])
            : Future.error("Invalid inputs provided");
      }
    } on Exception catch (e, trace) {
      print(trace.toString());
      log(e.toString());
      return Future.error("We are unable to connect our servers currently.");
    }
  }

// attach emergency contacts
  Future<String> emergencyContacts(Map<String, dynamic> data) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authenticatedUser.user?.accessToken}'
      };
      var request = Request('POST', Uri.parse(Apis.emergencyContacts));
      request.body = json.encode({
        "user_id": authenticatedUser.user?.user.id,
        ...data,
      });
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        // String? res = (await response.stream.bytesToString());
        return Future.value("Emergency contacts added successfully");
      } else {
        Client().close();
        log(await response.stream.bytesToString());
        String d = await response.stream.bytesToString();
        var res = json.decode(d);

        return d.contains('error')
            ? Future.error(res['error'])
            : Future.error("Invalid inputs provided");
      }
    } on Exception catch (e, trace) {
      print(trace.toString());
      log(e.toString());
      return Future.error("We are unable to connect our servers currently.");
    }
  }

// number types
  Future<List<EmergencyNumberModel>> getNumberTypes() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authenticatedUser.user?.accessToken}'
      };
      var request = Request(
        'GET',
        Uri.parse(
          Apis.emergencyNumberTypes,
        ),
      );
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        Client().close();
        return emergencyNumberModelFromJson(
            await response.stream.bytesToString());
      } else {
        Client().close();
        return Future.error(response.reasonPhrase ?? "");
      }
    } on Exception catch (e, stack) {
      if (kDebugMode) {
        print(stack);
      }
      return Future.error(e.toString());
    }
  }

// regions
  Future<List<RegionsModel>> regions() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authenticatedUser.user?.accessToken}'
      };
      var request = Request('GET', Uri.parse(Apis.regions));
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        String res = await response.stream.bytesToString();
        return regionsModelFromJson(res);
      } else {
        return Future.error(response.reasonPhrase ?? "");
      }
    } catch (e) {
      return Future.error("We are unable to connect our servers currently.");
    }
  }

  // education level
  Future<List<EducationModel>> education() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authenticatedUser.user?.accessToken}'
      };
      var request = Request('GET', Uri.parse(Apis.education));
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        String res = await response.stream.bytesToString();
        return educationModelFromJson(res);
      } else {
        return Future.error(response.reasonPhrase ?? "");
      }
    } catch (e) {
      return Future.error("We are unable to connect our servers currently.");
    }
  }

  // salary frequency
  Future<List<SalaryFrequencyModel>> salaryFrequency() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authenticatedUser.user?.accessToken}'
      };
      var request = Request(
        'GET',
        Uri.parse(
          Apis.salaryFrequency,
        ),
      );
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        String res = await response.stream.bytesToString();
        return salaryFrequencyModelFromJson(res);
      } else {
        return Future.error(response.reasonPhrase ?? "");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // marital status
  Future<List<MaritalStatusModel>> maritalStatus() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authenticatedUser.user?.accessToken}'
      };
      var request = Request(
        'GET',
        Uri.parse(
          Apis.maritalStatus,
        ),
      );
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        String res = await response.stream.bytesToString();
        return maritalStatusModelFromJson(res);
      } else {
        return Future.error(response.reasonPhrase ?? "");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // work status
  Future<List<WorkStatusModel>> workStatus() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authenticatedUser.user?.accessToken}'
      };
      // print(headers);
      var request = Request(
        'GET',
        Uri.parse(
          Apis.workStatus,
        ),
      );
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        String res = await response.stream.bytesToString();
        Client().close();
        return workStatusModelFromJson(res);
      } else {
        return Future.error(response.reasonPhrase ?? "");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

//
  Future<List<RelationshipsModel>> relationship() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authenticatedUser.user?.accessToken}'
      };
      var request = Request(
        'GET',
        Uri.parse(
          Apis.relationship,
        ),
      );
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        String res = await response.stream.bytesToString();
        Client().close();
        return relationshipsModelFromJson(res);
      } else {
        Client().close();
        return Future.error(response.reasonPhrase ?? "");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

// check existance of user profile
  Future<bool> checkProfile() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authenticatedUser.user?.accessToken}'
      };
      var request = Request('GET',
          Uri.parse("${Apis.userProfile}${authenticatedUser.user?.user.id}"));

      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    } catch (e) {
      return Future.value(false);
    }
  }
}
