import 'package:space_x/app/api_factory.dart';
import 'package:space_x/const/api_endpoints.dart';
import 'package:space_x/model/launch_model.dart';
import 'package:space_x/ui/launch/launch_enum.dart';
import 'dart:convert' as convert;

class LaunchRepository {
  Future<List<Launch>> getLaunches(LaunchEnum launchEnum) async {
    String endpoint = "${ApiEndpoints.baseUrl}${ApiEndpoints.apiV5}${ApiEndpoints.launchesUrl}";
    String response = await ApiFactory().getData(endpoint: "$endpoint/${launchEnum.name}");
    List<dynamic> list = convert.jsonDecode(response);
    List<Launch> launches = list.map((dynamic item) => Launch.fromJson(item)).toList();
    
    return launches;
  }
}
