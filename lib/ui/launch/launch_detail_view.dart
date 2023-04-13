import 'package:flutter/material.dart';
import 'package:space_x/model/launch_model.dart';
import 'package:space_x/ui/widgets/app_row_item.dart';
import 'package:space_x/ui/widgets/app_scaffold_layout.dart';

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
        AppRowItem(title: "Name:", value: launch.name),
        AppRowItem(title: "Date UTC:", value: launch.dateUtc.toIso8601String()),
        AppRowItem(title: "Success:", value: launch.success.toString()),
        AppRowItem(title: "Rocket:", value: launch.rocket),
        AppRowItem(title: "Upcoming:", value: launch.upcoming.toString()),
        AppRowItem(title: "Flight number:", value: launch.flightNumber.toString()),
        AppRowItem(title: "Details:", value: launch.details),
      ],
    );
  }
}
