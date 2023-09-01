import 'package:shared_preferences/shared_preferences.dart';
import '../core.dart';

abstract class Session {
  set setIndexLanguage(int index);
  set setLanguage(String lang);
  set setResultName(String name);
  set setResultCriteria(String criteria);
  set setResultWedding(String wedding);
  set setResultChild(String child);
  set setIsOpenName(bool openName);
  set setIsOpenCriteria(bool openCriteria);
  set setIsOpenWedding(bool openWedding);
  set setIsOpenChild(bool openChild);

  int get isIndex;
  String get isToken;
  String get isLang;
  String get resultName;
  String get resultCriteria;
  String get resultWedding;
  String get resultChild;
  bool get isOpenName;
  bool get isOpenCriteria;
  bool get isOpenWedding;
  bool get isOpenChild;
}

class SessionHelper implements Session {
  final SharedPreferences pref;

  SessionHelper({required this.pref});
  @override
  set setIndexLanguage(int index) {
    pref.setInt(IS_INDEX, index);
  }

  set setToken(String token) {
    pref.setString(SESSION_TOKEN, token);
  }

  @override
  set setLanguage(String lang) {
    pref.setString(IS_LANG, lang);
  }

  @override
  set setResultName(String name) {
    pref.setString(RESULTNAME, name);
  }

  @override
  set setResultCriteria(String criteria) {
    pref.setString(RESULTCRITERIA, criteria);
  }

  @override
  set setResultWedding(String wedding) {
    pref.setString(RESULTWEDDING, wedding);
  }

  @override
  set setResultChild(String child) {
    pref.setString(RESULTCHILD, child);
  }

  @override
  set setIsOpenName(bool openName) {
    pref.setBool(ISOPENAME, openName);
  }

  @override
  set setIsOpenCriteria(bool openCriteria) {
    pref.setBool(ISOPENCRITERIA, openCriteria);
  }

  @override
  set setIsOpenWedding(bool openWedding) {
    pref.setBool(ISOPENWEDDING, openWedding);
  }

  @override
  set setIsOpenChild(bool openChild) {
    pref.setBool(ISOPENCHILD, openChild);
  }

  @override
  int get isIndex => pref.getInt(IS_INDEX) ?? 0;
  @override
  String get isToken => pref.getString(SESSION_TOKEN) ?? '';
  String get isLang => pref.getString(IS_LANG) ?? '';
  String get resultName => pref.getString(RESULTNAME) ?? '';
  String get resultCriteria => pref.getString(RESULTCRITERIA) ?? '';
  String get resultWedding => pref.getString(RESULTWEDDING) ?? '';
  String get resultChild => pref.getString(RESULTCHILD) ?? '';
  bool get isOpenName => pref.getBool(ISOPENAME) ?? false;
  bool get isOpenCriteria => pref.getBool(ISOPENCRITERIA) ?? false;
  bool get isOpenWedding => pref.getBool(ISOPENWEDDING) ?? false;
  bool get isOpenChild => pref.getBool(ISOPENCHILD) ?? false;
}
