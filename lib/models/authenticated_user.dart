import 'dart:convert';

import '/exports/exports.dart';
import 'user_model.dart';

class AuthenticatedUser {
  UserModel? _user;
  UserModel? get user => _user;
  final StorageService _storageService = StorageService();
  Future<void> setUser(UserModel user) async {
    _user = user;
    await _storageService.setData("user", user.toJson());
  }

  // function to get the user from shared preferences
  Future<void> getUser() async {
    var user = await _storageService.getData("user");
    if (user != null) {
      // print(user);
      _user = UserModel.fromJson(json.decode(user));
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

//  AuthenticatedUser().getUser();
// global invocation
