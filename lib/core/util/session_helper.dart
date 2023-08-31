import 'package:shared_preferences/shared_preferences.dart';
import '../core.dart';

abstract class Session {
  set setIndexLanguage(int index);
  set setLanguage(String lang);

  int get isIndex;
  String get isToken;
  String get isLang;
}

class SessionHelper implements Session {
  final SharedPreferences pref;

  SessionHelper({required this.pref});
  @override
  set setIndexLanguage(int index) {
    pref.setInt(IS_INDEX, index);
  }

  @override
  set setToken(String token) {
    pref.setString(SESSION_TOKEN, token);
  }

  @override
  set setLanguage(String lang) {
    pref.setString(IS_LANG, lang);
  }

  @override
  int get isIndex => pref.getInt(IS_INDEX) ?? 0;
  @override
  String get isToken => pref.getString(SESSION_TOKEN) ?? '';
  String get isLang => pref.getString(IS_LANG) ?? '';
}
