part of 'launch_cubit.dart';

@immutable
abstract class LaunchState {}

class LaunchInitial extends LaunchState {}

class LaunchLoadingState extends LaunchState {}

class LaunchFailureState extends LaunchState {
  final String errorMessage;
  LaunchFailureState(this.errorMessage);
}

class LaunchListSuccessState extends LaunchState {
  final List<Launch> launchList;
  LaunchListSuccessState(this.launchList);
}
