import 'package:space_x/app/api_factory.dart';
import 'package:space_x/const/api_endpoints.dart';
import 'dart:convert' as convert;

import 'package:space_x/model/company_model.dart';

class CompanyRepository {
  Future<Company> getCompany() async {
    String endpoint = ApiEndpoints.baseUrl + ApiEndpoints.apiV4 + ApiEndpoints.companyUrl;
    String response = await ApiFactory().getData(endpoint: endpoint);
    Company company = Company.fromJson(convert.jsonDecode(response));

    return company;
  }
}
