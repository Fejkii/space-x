import 'package:http/http.dart' as http;
import 'package:space_x/app/api_result_handler.dart';

class ApiFactory {
  Future<ApiResults> getData({
    required String endpoint,
  }) async {
    try {
      var url = Uri.parse(endpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return ApiSuccess(response.body, response.statusCode);
      } else {
        throw "Unable to retrieve data.";
      }
    } catch (e) {
      return ApiFailure(400, e.toString());
    }
  }
}
