import 'package:flutter/material.dart';
import 'package:space_x/const/app_strings.dart';
import 'package:space_x/const/app_values.dart';
import 'package:space_x/model/launch_model.dart';
import 'package:space_x/ui/rocket/rocket_detail_view.dart';
import 'package:space_x/ui/widgets/app_row_item.dart';
import 'package:space_x/ui/widgets/app_scaffold_layout.dart';
import 'package:space_x/ui/widgets/app_text_button.dart';

class LaunchDetailView extends StatefulWidget {
  final Launch launch;
  const LaunchDetailView({
    Key? key,
    required this.launch,
  }) : super(key: key);

  @override
  State<LaunchDetailView> createState() => _LaunchDetailViewState();
}

class _LaunchDetailViewState extends State<LaunchDetailView> {
  late Launch launch;

  @override
  void initState() {
    launch = widget.launch;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldLayout(
      body: _body(),
      appBar: AppBar(
        title: Text(widget.launch.name),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        AppRowItem(title: AppStrings.name, value: launch.name),
        AppRowItem(title: AppStrings.dateUTC, value: launch.dateUtc.toIso8601String()),
        AppRowItem(title: AppStrings.success, value: launch.success.toString()),
        AppRowItem(title: AppStrings.rocketId, value: launch.rocket),
        AppRowItem(title: AppStrings.upcoming, value: launch.upcoming.toString()),
        AppRowItem(title: AppStrings.flightNumber, value: launch.flightNumber.toString()),
        AppRowItem(title: AppStrings.details, value: launch.details),
        const SizedBox(height: AppPadding.p15),
        AppTextButton(
          title: AppStrings.rocketDetail,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RocketDetailView(rocketId: launch.rocket),
              ),
            );
          },
        ),
      ],
    );
  }
}
