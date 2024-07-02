import '/exports/exports.dart';

class AuthController with ChangeNotifier {
  // loader
  bool _authLoading = false;
  bool get authLoading => _authLoading;
  set authLoading(bool value) {
    _authLoading = value;
    notifyListeners();
  }
}
