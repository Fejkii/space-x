import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_x/const/app_values.dart';
import 'package:space_x/ui/launch/launch_enum.dart';

enum AppPreferencesKeys {
  launchSegment,
  launchSearchBy,
  launchSortBy,
  launchSortType,
}

class AppPreferences {
  late SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<SharedPreferences> initSP() async {
    return _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setLaunchSegment(LaunchSegment launchSegment) async {
    await _sharedPreferences.setString(AppPreferencesKeys.launchSegment.name, launchSegment.toString());
  }

  LaunchSegment getLaunchSegment() {
    String? launchSegment = _sharedPreferences.getString(AppPreferencesKeys.launchSegment.name);
    if (launchSegment != null && launchSegment.isNotEmpty) {
      return LaunchSegment.values.firstWhere((e) => e.toString() == launchSegment);
    } else {
      return LaunchSegment.upcoming;
    }
  }

  Future<void> setLaunchSearchBy(LaunchSearchBy searchBy) async {
    await _sharedPreferences.setString(AppPreferencesKeys.launchSearchBy.name, searchBy.toString());
  }

  LaunchSearchBy getLaunchSearchBy() {
    String? searchBy = _sharedPreferences.getString(AppPreferencesKeys.launchSearchBy.name);
    if (searchBy != null && searchBy.isNotEmpty) {
      return LaunchSearchBy.values.firstWhere((e) => e.toString() == searchBy);
    } else {
      return LaunchSearchBy.name;
    }
  }

  Future<void> setLaunchSortBy(LaunchSortBy launchSortBy) async {
    await _sharedPreferences.setString(AppPreferencesKeys.launchSortBy.name, launchSortBy.toString());
  }

  LaunchSortBy getLaunchSortBy() {
    String? launchSortBy = _sharedPreferences.getString(AppPreferencesKeys.launchSortBy.name);
    if (launchSortBy != null && launchSortBy.isNotEmpty) {
      return LaunchSortBy.values.firstWhere((e) => e.toString() == launchSortBy);
    } else {
      return LaunchSortBy.name;
    }
  }

  Future<void> setLaunchSortType(SortType sortType) async {
    await _sharedPreferences.setString(AppPreferencesKeys.launchSortType.name, sortType.toString());
  }

  SortType getLaunchSortType() {
    String? sortType = _sharedPreferences.getString(AppPreferencesKeys.launchSortType.name);
    if (sortType != null && sortType.isNotEmpty) {
      return SortType.values.firstWhere((e) => e.toString() == sortType);
    } else {
      return SortType.asc;
    }
  }
}
