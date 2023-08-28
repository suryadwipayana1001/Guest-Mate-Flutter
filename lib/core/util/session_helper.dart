import 'package:shared_preferences/shared_preferences.dart';
import '../core.dart';

abstract class Session {
  set setLoggedIn(bool login);
  set setToken(String token);
  set setName(String name);
  set setAge(String age);
  set setGender(String gender);
  set setEducation(String education);
  set setExperience(String experience);
  set setHobbies(String hobbies);
  set setSkill(String skill);
  set setQuestation1(String questation1);
  set setQuestation2(String questation2);
  set setQuestation3(String questation3);
  set setQuestation4(String questation4);
  set setQuestation5(String questation5);
  set setQuestation6(String questation6);
  set setQuestation7(String questation7);
  set setQuestation8(String questation8);
  bool get isLoggedIn;
  String get isToken;
  String get isName;
  String get isAge;
  String get isGender;
  String get isEducation;
  String get isExperience;
  String get isHobbies;
  String get isSkill;
  String get isQuestation1;
  String get isQuestation2;
  String get isQuestation3;
  String get isQuestation4;
  String get isQuestation5;
  String get isQuestation6;
  String get isQuestation7;
  String get isQuestation8;
}

class SessionHelper implements Session {
  final SharedPreferences pref;

  SessionHelper({required this.pref});
  @override
  set setLoggedIn(bool login) {
    pref.setBool(IS_LOGGED_IN, login);
  }

  @override
  set setToken(String token) {
    pref.setString(SESSION_TOKEN, token);
  }

  @override
  set setName(String name) {
    pref.setString(IS_NAME, name);
  }

  @override
  set setAge(String age) {
    pref.setString(IS_AGE, age);
  }

  @override
  set setGender(String gender) {
    pref.setString(IS_GENDER, gender);
  }

  @override
  set setEducation(String education) {
    pref.setString(IS_EDUCATION, education);
  }

  @override
  set setExperience(String experience) {
    pref.setString(IS_EXPERIENCE, experience);
  }

  @override
  set setHobbies(String hobbies) {
    pref.setString(IS_HOBBIES, hobbies);
  }

  @override
  set setSkill(String skill) {
    pref.setString(IS_SKILL, skill);
  }

  @override
  set setQuestation1(String questation1) {
    pref.setString(IS_QUESTATION1, questation1);
  }

  @override
  set setQuestation2(String questation2) {
    pref.setString(IS_QUESTATION2, questation2);
  }

  @override
  set setQuestation3(String questation3) {
    pref.setString(IS_QUESTATION3, questation3);
  }

  @override
  set setQuestation4(String questation4) {
    pref.setString(IS_QUESTATION4, questation4);
  }

  @override
  set setQuestation5(String questation5) {
    pref.setString(IS_QUESTATION5, questation5);
  }

  @override
  set setQuestation6(String questation6) {
    pref.setString(IS_QUESTATION6, questation6);
  }

  @override
  set setQuestation7(String questation7) {
    pref.setString(IS_QUESTATION7, questation7);
  }

  @override
  set setQuestation8(String questation8) {
    pref.setString(IS_QUESTATION8, questation8);
  }

  @override
  bool get isLoggedIn => pref.getBool(IS_LOGGED_IN) ?? false;
  @override
  String get isToken => pref.getString(SESSION_TOKEN) ?? '';
  @override
  String get isName => pref.getString(IS_NAME) ?? '';
  @override
  String get isAge => pref.getString(IS_AGE) ?? '';
  @override
  String get isGender => pref.getString(IS_GENDER) ?? '';
  @override
  String get isEducation => pref.getString(IS_EDUCATION) ?? '';
  @override
  String get isExperience => pref.getString(IS_EXPERIENCE) ?? '';
  @override
  String get isHobbies => pref.getString(IS_HOBBIES) ?? '';
  @override
  String get isSkill => pref.getString(IS_SKILL) ?? '';
  @override
  String get isQuestation1 => pref.getString(IS_QUESTATION1) ?? '';
  @override
  String get isQuestation2 => pref.getString(IS_QUESTATION2) ?? '';
  @override
  String get isQuestation3 => pref.getString(IS_QUESTATION3) ?? '';
  @override
  String get isQuestation4 => pref.getString(IS_QUESTATION4) ?? '';
  @override
  String get isQuestation5 => pref.getString(IS_QUESTATION5) ?? '';
  @override
  String get isQuestation6 => pref.getString(IS_QUESTATION6) ?? '';
  @override
  String get isQuestation7 => pref.getString(IS_QUESTATION7) ?? '';
  @override
  String get isQuestation8 => pref.getString(IS_QUESTATION8) ?? '';
}
