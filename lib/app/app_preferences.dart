import 'package:shared_preferences/shared_preferences.dart';

enum AppPreferencesKeys {
  launchFilter,
}

class AppPreferences {
  late SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<SharedPreferences> initSP() async {
    return _sharedPreferences = await SharedPreferences.getInstance();
  }

  // TODO: safe filter data
  // Future<void> setLaunchFilter(String filter) async {
  //   await _sharedPreferences.setString(AppPreferencesKeys.launchFilter.name, filter);
  // }

  // String? getLaunchFilter() {
  //   return _sharedPreferences.getString(AppPreferencesKeys.launchFilter.name);
  // }
}
