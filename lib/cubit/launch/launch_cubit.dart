import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/app/api_result_handler.dart';
import 'package:space_x/const/app_values.dart';
import 'package:space_x/model/launch_model.dart';
import 'package:space_x/repository/launch_repository.dart';
import 'package:space_x/ui/launch/launch_enum.dart';

part 'launch_state.dart';

class LaunchCubit extends Cubit<LaunchState> {
  LaunchCubit() : super(LaunchInitial());

  void getLaunchList(LaunchSegment launchEnum) async {
    emit(LaunchLoadingState());
    ApiResults apiResults = await LaunchRepository().getLauncheList(launchEnum);
    if (apiResults is ApiSuccess) {
      List<dynamic> list = convert.jsonDecode(apiResults.data);
      List<Launch> launcheList = list.map((dynamic item) => Launch.fromJson(item)).toList();
      emit(LaunchListSuccessState(launcheList));
    } else if (apiResults is ApiFailure) {
      emit(LaunchFailureState(apiResults.message));
    }
  }

  void getFilteredLaunchList(LaunchSegment launchSegment, LaunchSortBy orderBy, SortType orderType) async {
    emit(LaunchLoadingState());
    ApiResults apiResults = await LaunchRepository().getOrderedLauncheList(launchSegment, orderBy, orderType);
    if (apiResults is ApiSuccess) {
      LaunchQuery launchQuery = LaunchQuery.fromJson(convert.jsonDecode(apiResults.data));
      emit(LaunchListSuccessState(launchQuery.launches!));
    } else if (apiResults is ApiFailure) {
      emit(LaunchFailureState(apiResults.message));
    }
  }
}
