import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUser {
  static final PreferencesUser _instance = PreferencesUser._internal();

  factory PreferencesUser() {
    return _instance;
  }

  PreferencesUser._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // se crean los getters an setters
  get genre {
    return _prefs.getInt("genre") ?? 1;
  }

  set genre(int value) {
    _prefs.setInt("genre", value);
  }

  get colorSecondary {
    return _prefs.getBool("color_secondary") ?? false;
  }

  set colorSecondary(bool value) {
    _prefs.setBool("color_secondary", value);
  }

  get name {
    return _prefs.getString("name") ?? "";
  }

  set name(String value) {
    _prefs.setString("name", value);
  }

  get lastPage {
    return _prefs.getString("lastPage") ?? "home";
  }

  set lastPage(String value) {
    _prefs.setString("lastPage", value);
  }
}
