part of 'rocket_cubit.dart';

@immutable
abstract class RocketState {}

class RocketInitial extends RocketState {}

class RocketLoadingState extends RocketState {}

class RocketFailureState extends RocketState {
  final String errorMessage;
  RocketFailureState(this.errorMessage);
}

class RocketListSuccessState extends RocketState {
  final List<Rocket> rocketList;
  RocketListSuccessState(this.rocketList);
}

class RocketSuccessState extends RocketState {
  final Rocket rocket;
  RocketSuccessState(this.rocket);
}
