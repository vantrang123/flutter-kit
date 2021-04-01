import 'package:shared_preferences/shared_preferences.dart';
import 'package:starterkit/localization/language_constants.dart';
import 'package:starterkit/utils/constants.dart';

class Prefs {
  static SharedPreferences _prefs;

  /// create singleton
  static final Prefs _singleton = Prefs._internal();
  factory Prefs() {
    _singleton.initializeMe();
    return _singleton;
  }

  Prefs._internal();

  void initializeMe() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void setLanguage(languageCode) async {
    await _prefs.setString(LAGUAGE_CODE, languageCode);
  }

  String getLanguage() {
    return _prefs.getString(LAGUAGE_CODE);
  }

  void setRunKey(isRun) async {
    await _prefs.setBool(Constants.appPreviouslyRunKey, isRun);
  }

  bool getRunKey() {
    return _prefs.getBool(Constants.appPreviouslyRunKey);
  }
}