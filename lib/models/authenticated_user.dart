import 'dart:async';
import 'dart:convert';

import '/exports/exports.dart';
import 'user_model.dart';

class AuthenticatedUser {
  UserModel? _user;
  UserModel? get user => _user;
  final StorageService _storageService = StorageService();

  // function to get the user from shared preferences
  Future<void> getUser() async {
    var sUser = await _storageService.getData("user");
    //
    if (sUser != null) {
      _user = UserModel.fromJson(json.decode(sUser));
    }
  }

  // constructor
  AuthenticatedUser() {
    getUser();
  }
}

//  AuthenticatedUser().getUser();
// global invocation
AuthenticatedUser _authenticatedUser = AuthenticatedUser();
AuthenticatedUser get authenticatedUser => _authenticatedUser;
