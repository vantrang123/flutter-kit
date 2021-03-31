import 'package:shared_preferences/shared_preferences.dart';
import 'package:starterkit/localization/language_constants.dart';
import 'package:starterkit/utils/constants.dart';

class LocalStorage {
  static final LocalStorage _singleton = LocalStorage._internal();
  static SharedPreferences prefs;

  factory LocalStorage() {
    _singleton.initializeMe();
    return _singleton;
  }

  LocalStorage._internal();

  void initializeMe() async {
    prefs = await SharedPreferences.getInstance();
  }

  void setLanguage(languageCode) async {
    await prefs.setString(LAGUAGE_CODE, languageCode);
  }

  String getLanguage() {
    return prefs.getString(LAGUAGE_CODE);
  }

  void setRunKey(isRun) async {
    await prefs.setBool(Constants.appPreviouslyRunKey, isRun);
  }

  bool getRunKey() {
    return prefs.getBool(Constants.appPreviouslyRunKey);
  }
}