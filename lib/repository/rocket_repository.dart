import 'package:space_x/app/api_factory.dart';
import 'package:space_x/const/api_endpoints.dart';
import 'package:space_x/model/rocket_model.dart';
import 'dart:convert' as convert;

class RocketRepository {
  Future<List<Rocket>> getRockets() async {
    String endpoint = "${ApiEndpoints.baseUrl}${ApiEndpoints.apiV4}${ApiEndpoints.rocketUrl}";
    String response = await ApiFactory().getData(endpoint: endpoint);
    List<dynamic> list = convert.jsonDecode(response);
    List<Rocket> rockets = list.map((dynamic item) => Rocket.fromJson(item)).toList();

    return rockets;
  }

  Future<Rocket> getRocketById(String rocketId) async {
    String endpoint = "${ApiEndpoints.baseUrl}${ApiEndpoints.apiV4}${ApiEndpoints.rocketUrl}";
    String response = await ApiFactory().getData(endpoint: "$endpoint/$rocketId");
    Rocket rocket = Rocket.fromJson(convert.jsonDecode(response));

    return rocket;
  }
}
