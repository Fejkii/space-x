import 'package:space_x/app/api_factory.dart';
import 'package:space_x/app/api_result_handler.dart';
import 'package:space_x/const/api_endpoints.dart';
import 'package:space_x/ui/launch/launch_enum.dart';

class LaunchRepository {
  Future<ApiResults> getLauncheList(LaunchEnum launchEnum) async {
    String endpoint = "${ApiEndpoints.baseUrl}${ApiEndpoints.apiV5}${ApiEndpoints.launchesUrl}";

    return ApiFactory().getData(endpoint: "$endpoint/${launchEnum.name}");
  }
}
