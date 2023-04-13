import 'package:http/http.dart' as http;

class ApiFactory {
  Future getData({
    required String endpoint,
  }) async {
    var url = Uri.parse(endpoint);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw "Unable to retrieve data.";
    }
  }
}
