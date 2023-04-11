import 'package:flutter/material.dart';
import 'package:space_x/const/app_strings.dart';

class CompanyView extends StatefulWidget {
  const CompanyView({super.key});

  @override
  State<CompanyView> createState() => _CompanyViewState();
}

class _CompanyViewState extends State<CompanyView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppStrings.company),
    );
  }
}
