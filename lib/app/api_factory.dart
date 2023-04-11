import 'package:http/http.dart' as http;
import 'package:space_x/const/api_endpoints.dart';
import 'dart:convert' as convert;

import 'package:space_x/model/launch_model.dart';

class ApiFactory {
  Future<List<Launch>> getLaunches() async {
    var url = Uri.parse("${ApiEndpoints.baseUrl}${ApiEndpoints.launchesUrl}/past");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> body = convert.jsonDecode(response.body);
      List<Launch> launches = body.map((dynamic item) => Launch.fromJson(item)).toList();
      return launches;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw "Unable to retrieve launches.";
    }
  }
}