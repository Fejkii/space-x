import 'dart:convert';

import 'package:space_x/app/api_factory.dart';
import 'package:space_x/app/api_result_handler.dart';
import 'package:space_x/const/api_endpoints.dart';
import 'package:space_x/const/app_values.dart';
import 'package:space_x/ui/launch/launch_enum.dart';

class LaunchRepository {
  Future<ApiResults> getLauncheList(LaunchSegment launchEnum) async {
    String endpoint = "${ApiEndpoints.baseUrl}${ApiEndpoints.apiV5}${ApiEndpoints.launchesUrl}";

    return ApiFactory().getData(endpoint: "$endpoint/${launchEnum.name}");
  }

  Future<ApiResults> getOrderedLauncheList(LaunchSegment launchSegment, LaunchSortBy launchAccording, SortType orderType) async {
    String endpoint = "${ApiEndpoints.baseUrl}${ApiEndpoints.apiV5}${ApiEndpoints.launchesUrl}/query";
    bool upcoming = LaunchSegment.upcoming == launchSegment;
    var params = {
      "query": {
        "upcoming": upcoming,
      },
      "options": {
        "limit": 200,
        "sort": {
          launchAccording.name: orderType.name,
        }
      }
    };

    return ApiFactory().postMethod(endpoint: endpoint, parameters: jsonEncode(params));
  }
}
