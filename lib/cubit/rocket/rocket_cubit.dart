import 'package:space_x/app/api_result_handler.dart';
import 'package:space_x/model/rocket_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/repository/rocket_repository.dart';
import 'dart:convert' as convert;

part 'rocket_state.dart';

class RocketCubit extends Cubit<RocketState> {
  RocketCubit() : super(RocketInitial());

  void getRocketList() async {
    emit(RocketLoadingState());
    ApiResults apiResults = await RocketRepository().getRocketList();
    if (apiResults is ApiSuccess) {
      List<dynamic> list = convert.jsonDecode(apiResults.data);
      List<Rocket> rocketList = list.map((dynamic item) => Rocket.fromJson(item)).toList();

      emit(RocketListSuccessState(rocketList));
    } else if (apiResults is ApiFailure) {
      emit(RocketFailureState(apiResults.message));
    }
  }

  void getRocket(String rocketId) async {
    emit(RocketLoadingState());
    ApiResults apiResults = await RocketRepository().getRocketById(rocketId);
    if (apiResults is ApiSuccess) {
      Rocket rocket = Rocket.fromJson(convert.jsonDecode(apiResults.data));
      emit(RocketSuccessState(rocket));
    } else if (apiResults is ApiFailure) {
      emit(RocketFailureState(apiResults.message));
    }
  }
}
