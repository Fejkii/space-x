import 'package:flutter/material.dart';
import 'package:space_x/const/app_strings.dart';
import 'package:space_x/const/app_values.dart';
import 'package:space_x/model/company_model.dart';
import 'package:space_x/repository/company_repository.dart';
import 'package:space_x/ui/widgets/app_scaffold_layout.dart';
import 'package:space_x/ui/widgets/app_text_styles.dart';

class CompanyView extends StatefulWidget {
  const CompanyView({super.key});

  @override
  State<CompanyView> createState() => _CompanyViewState();
}

class _CompanyViewState extends State<CompanyView> {
  late Company company;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldLayout(
      body: _body(),
      appBar: AppBar(
        title: const Text(AppStrings.company),
      ),
    );
  }

  Widget _body() {
    return FutureBuilder(
      future: CompanyRepository().getCompany(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          company = snapshot.data!;
          return _companyWidget();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _companyWidget() {
    return Column(
      children: [
        Row(
          children: [
            const AppTitleText(text: AppStrings.name),
            const SizedBox(width: AppPadding.p10),
            AppText(text: company.name ?? ""),
          ],
        ),
        Row(
          children: [
            const AppTitleText(text: AppStrings.founder),
            const SizedBox(width: AppPadding.p10),
            AppText(text: company.founder ?? ""),
          ],
        ),
        Row(
          children: [
            const AppTitleText(text: AppStrings.founded),
            const SizedBox(width: AppPadding.p10),
            AppText(text: company.founded.toString()),
          ],
        ),
        Row(
          children: [
            const AppTitleText(text: AppStrings.employees),
            const SizedBox(width: AppPadding.p10),
            AppText(text: company.employees.toString()),
          ],
        ),
        Row(
          children: [
            const AppTitleText(text: AppStrings.ceo),
            const SizedBox(width: AppPadding.p10),
            AppText(text: company.ceo ?? ""),
          ],
        ),
        Row(
          children: [
            const AppTitleText(text: AppStrings.cto),
            const SizedBox(width: AppPadding.p10),
            AppText(text: company.cto ?? ""),
          ],
        ),
        Row(
          children: [
            const AppTitleText(text: AppStrings.coo),
            const SizedBox(width: AppPadding.p10),
            AppText(text: company.coo ?? ""),
          ],
        ),
        Row(
          children: [
            const AppTitleText(text: AppStrings.valuation),
            const SizedBox(width: AppPadding.p10),
            AppText(text: company.valuation.toString()),
          ],
        ),
        Row(
          children: [
            const AppTitleText(text: AppStrings.summary),
            const SizedBox(width: AppPadding.p10),
            Expanded(child: AppText(text: company.summary ?? "")),
          ],
        ),
      ],
    );
  }
}
