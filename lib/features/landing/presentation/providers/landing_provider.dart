import 'package:flutter/material.dart';

class LandingProvider with ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _hobbyContoller = TextEditingController();

  final List<String> jenisKelaminList = <String>[
    "laki-laki",
    "perempuan",
  ];
  String _gender = "laki-laki";

  set setGender(val) {
    _gender = val;
    notifyListeners();
  }

  GlobalKey<FormState> get formKey => _formKey;
  String get gender => _gender;
  TextEditingController get ageController => _ageController;
  TextEditingController get nameController => _nameController;
  TextEditingController get hobbyController => _hobbyContoller;

  //Handle Error
  bool _nameError = false;
  bool _ageError = false;
  bool _hobbyError = false;

  set setAgeError(val) {
    _ageError = val;
    notifyListeners();
  }

  set setNameError(val) {
    _nameError = val;
    notifyListeners();
  }

  set setHobbiyError(val) {
    _hobbyError = val;
    notifyListeners();
  }

  bool get hobbyError => _hobbyError;
  bool get nameError => _nameError;
  bool get ageError => _ageError;
}
