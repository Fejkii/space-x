import 'package:space_x/app/api_factory.dart';
import 'package:space_x/app/api_result_handler.dart';
import 'package:space_x/const/api_endpoints.dart';

class CompanyRepository {
  Future<ApiResults> getCompany() async {
    String endpoint = ApiEndpoints.baseUrl + ApiEndpoints.apiV4 + ApiEndpoints.companyUrl;

    return await ApiFactory().getData(endpoint: endpoint);
  }
}
