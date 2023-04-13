import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/app/dependency_injection.dart';
import 'package:space_x/const/app_strings.dart';
import 'package:space_x/const/app_values.dart';
import 'package:space_x/cubit/company/company_cubit.dart';
import 'package:space_x/model/company_model.dart';
import 'package:space_x/ui/widgets/app_loading_indicator.dart';
import 'package:space_x/ui/widgets/app_row_item.dart';
import 'package:space_x/ui/widgets/app_scaffold_layout.dart';
import 'package:space_x/ui/widgets/app_toast_message.dart';

class CompanyView extends StatefulWidget {
  const CompanyView({super.key});

  @override
  State<CompanyView> createState() => _CompanyViewState();
}

class _CompanyViewState extends State<CompanyView> {
  CompanyCubit companyCubit = instance<CompanyCubit>();
  late Company? company;

  @override
  void initState() {
    company = null;
    _getData();
    super.initState();
  }

  void _getData() {
    companyCubit.getCompany();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyCubit, CompanyState>(
      builder: (context, state) {
        return AppScaffoldLayout(
          body: _body(),
          appBar: AppBar(
            title: const Text(AppStrings.company),
          ),
        );
      },
    );
  }

  Widget _body() {
    return BlocConsumer<CompanyCubit, CompanyState>(
      listener: (context, state) {
        if (state is CompanySuccessState) {
          company = state.company;
        } else if (state is CompanyFailureState) {
          AppToastMessage().showToastMsg(state.errorMessage, ToastStates.error);
        }
      },
      builder: (BuildContext context, CompanyState state) {
        if (state is CompanyLoadingState) {
          return const AppLoadingIndicator();
        } else {
          return _companyWidget();
        }
      },
    );
  }

  Widget _companyWidget() {
    return Column(
      children: [
        AppRowItem(title: AppStrings.name, value: company?.name ?? ""),
        AppRowItem(title: AppStrings.founder, value: company?.founder ?? ""),
        AppRowItem(title: AppStrings.founded, value: company?.founded.toString() ?? ""),
        AppRowItem(title: AppStrings.employees, value: company?.employees.toString() ?? ""),
        AppRowItem(title: AppStrings.ceo, value: company?.ceo ?? ""),
        AppRowItem(title: AppStrings.cto, value: company?.cto ?? ""),
        AppRowItem(title: AppStrings.coo, value: company?.coo ?? ""),
        AppRowItem(title: AppStrings.valuation, value: company?.valuation.toString() ?? ""),
        AppRowItem(title: AppStrings.summary, value: company?.summary ?? ""),
      ],
    );
  }
}
