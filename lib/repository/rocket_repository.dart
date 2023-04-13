import 'package:space_x/app/api_factory.dart';
import 'package:space_x/app/api_result_handler.dart';
import 'package:space_x/const/api_endpoints.dart';

class RocketRepository {
  Future<ApiResults> getRocketList() async {
    String endpoint = "${ApiEndpoints.baseUrl}${ApiEndpoints.apiV4}${ApiEndpoints.rocketUrl}";

    return await ApiFactory().getData(endpoint: endpoint);
  }

  Future<ApiResults> getRocketById(String rocketId) async {
    String endpoint = "${ApiEndpoints.baseUrl}${ApiEndpoints.apiV4}${ApiEndpoints.rocketUrl}";

    return await ApiFactory().getData(endpoint: "$endpoint/$rocketId");
  }
}
