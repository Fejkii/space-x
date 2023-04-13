part of 'company_cubit.dart';

@immutable
abstract class CompanyState {}

class CompanyInitial extends CompanyState {}

class CompanyLoadingState extends CompanyState {}

class CompanyFailureState extends CompanyState {
  final String errorMessage;

  CompanyFailureState(this.errorMessage);
}

class CompanySuccessState extends CompanyState {
  final Company company;
  CompanySuccessState(this.company);
}
