// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:space_x/model/launch_model.dart';
import 'package:space_x/ui/widgets/app_scaffold_layout.dart';
import 'package:space_x/ui/widgets/app_text_styles.dart';

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
        Row(
          children: [
            const AppTitleText(text: "Name:"),
            const SizedBox(width: 10),
            AppText(text: widget.launch.name),
          ],
        ),
        Row(
          children: [
            const AppTitleText(text: "Date UTC:"),
            const SizedBox(width: 10),
            AppText(text: widget.launch.dateUtc.toIso8601String()),
          ],
        ),
        Row(
          children: [
            const AppTitleText(text: "Success:"),
            const SizedBox(width: 10),
            AppText(text: widget.launch.success.toString()),
          ],
        ),
        Row(
          children: [
            const AppTitleText(text: "Rocket:"),
            const SizedBox(width: 10),
            AppText(text: widget.launch.rocket),
          ],
        ),
        Row(
          children: [
            const AppTitleText(text: "Upcoming:"),
            const SizedBox(width: 10),
            AppText(text: widget.launch.upcoming.toString()),
          ],
        ),
        Row(
          children: [
            const AppTitleText(text: "Flight number:"),
            const SizedBox(width: 10),
            AppText(text: widget.launch.flightNumber.toString()),
          ],
        ),
        Row(
          children: [
            const AppTitleText(text: "Details:"),
            const SizedBox(width: 10),
            Expanded(
              child: AppText(text: widget.launch.details ?? ""),
            ),
          ],
        ),
      ],
    );
  }
}
