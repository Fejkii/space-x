// ignore_for_file: constant_identifier_names
import 'package:space_x/const/app_strings.dart';

enum LaunchSegment {
  past,
  upcoming,
}

enum LaunchSearchBy {
  name,
  flight_number,
}

extension LaunchSearchByExtension on LaunchSearchBy {
  String getTitle() {
    switch (this) {
      case LaunchSearchBy.name:
        return AppStrings.name;
      case LaunchSearchBy.flight_number:
        return AppStrings.flightNumber;
      default:
        return "";
    }
  }
}

enum LaunchSortBy {
  name,
  date_utc,
  flight_number,
}

extension LaunchSortByExtension on LaunchSortBy {
  String getTitle() {
    switch (this) {
      case LaunchSortBy.name:
        return AppStrings.name;
      case LaunchSortBy.date_utc:
        return AppStrings.date;
      case LaunchSortBy.flight_number:
        return AppStrings.flightNumber;
      default:
        return "";
    }
  }
}
