import 'package:flutter/material.dart';
import 'package:space_x/model/rocket_model.dart';
import 'package:space_x/ui/widgets/app_row_item.dart';
import 'package:space_x/ui/widgets/app_scaffold_layout.dart';

class RocketDetailView extends StatefulWidget {
  final Rocket rocket;
  const RocketDetailView({
    Key? key,
    required this.rocket,
  }) : super(key: key);

  @override
  State<RocketDetailView> createState() => _RocketDetailViewState();
}

class _RocketDetailViewState extends State<RocketDetailView> {
  late Rocket rocket;
  @override
  void initState() {
    rocket = widget.rocket;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldLayout(
      body: _body(),
      appBar: AppBar(
        title: Text(widget.rocket.name ?? ""),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        AppRowItem(title: "Name:", value: rocket.name),
        AppRowItem(title: "Commpany:", value: rocket.company),
        AppRowItem(title: "Height [m]:", value: rocket.height != null ? rocket.height!.meters.toString() : null),
        AppRowItem(title: "Country:", value: rocket.country),
        AppRowItem(title: "Active:", value: rocket.active.toString()),
        AppRowItem(title: "Type:", value: rocket.type),
        AppRowItem(title: "Description:", value: rocket.description),
      ],
    );
  }
}
