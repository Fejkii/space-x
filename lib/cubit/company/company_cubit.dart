import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/app/api_result_handler.dart';
import 'package:space_x/model/company_model.dart';
import 'package:flutter/material.dart';
import 'package:space_x/repository/company_repository.dart';
import 'dart:convert' as convert;

part 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit() : super(CompanyInitial());

  void getCompany() async {
    emit(CompanyLoadingState());
    ApiResults apiResults = await CompanyRepository().getCompany();
    if (apiResults is ApiSuccess) {
      Company company = Company.fromJson(convert.jsonDecode(apiResults.data));
      emit(CompanySuccessState(company));
    } else if(apiResults is ApiFailure) {
      emit(CompanyFailureState(apiResults.message));
    }
  }
}
