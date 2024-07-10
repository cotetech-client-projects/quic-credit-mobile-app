// ignore_for_file: non_constant_identifier_names

import 'package:quic_credit/models/marital_status_model.dart';

import '../exports/exports.dart';
import '../models/emergency_number_model.dart';

class DataController with ChangeNotifier {
  // loader
  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<MaritalStatusModel> _maritalStatus = [];
  List<MaritalStatusModel> get maritalStatus => _maritalStatus;
  void fetchMaritalStatus() async {
    AuthService().maritalStatus().then((marital) {
      _maritalStatus = marital;
      notifyListeners();
    });
  }

  //
  List<RegionsModel> _regions = [];
  List<RegionsModel> get regions => _regions;
  void fetchRegions() async {
    AuthService().regions().then((value) {
      _regions = value;
      notifyListeners();
    });
  }

  // relationship
  List<RelationshipsModel> _relationship = [];
  List<RelationshipsModel> get relationship => _relationship;
  void fetchRelationship() async {
    AuthService().relationship().then((value) {
      _relationship = value;
      notifyListeners();
    });
  }

  // emergency numbers
  List<EmergencyNumberModel> _emergency_numbers = [];
  List<EmergencyNumberModel> get emergency_numbers => _emergency_numbers;
  void fetchEmergencyNumbers() {
    AuthService().getNumberTypes().then((value) {
      _emergency_numbers = value;
      notifyListeners();
    });
  }

  // education
  List<EducationModel> _education = [];
  List<EducationModel> get education => _education;
  void fetchEducation() {
    AuthService().education().then((value) {
      _education = value;
      notifyListeners();
    });
  }

// work status
  List<WorkStatusModel> _workStatus = [];
  List<WorkStatusModel> get workStatus => _workStatus;
  void fetchWorkStatus() {
    AuthService().workStatus().then((value) {
      _workStatus = value;
      notifyListeners();
    });
  }

  // salary frequency
  List<SalaryFrequencyModel> _salaryFrequency = [];
  List<SalaryFrequencyModel> get salaryFrequency => _salaryFrequency;
  void fetchSalaryFrequency() async {
    AuthService().salaryFrequency().then((value) {
      _salaryFrequency = value;
      notifyListeners();
    });
  }
  // 

  //
  DataController() {
    //
    fetchMaritalStatus();
    //
    fetchRegions();
    //
    fetchRelationship();
    //
    fetchEducation();
    //
    fetchWorkStatus();
    //
    fetchSalaryFrequency();
  }
}
