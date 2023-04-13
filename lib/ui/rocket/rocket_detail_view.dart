import 'package:flutter/material.dart';
import 'package:space_x/model/rocket_model.dart';
import 'package:space_x/repository/rocket_repository.dart';
import 'package:space_x/ui/widgets/app_row_item.dart';
import 'package:space_x/ui/widgets/app_scaffold_layout.dart';

class RocketDetailView extends StatefulWidget {
  final Rocket? rocket;
  final String? rocketId;
  const RocketDetailView({
    Key? key,
    this.rocket,
    this.rocketId,
  }) : super(key: key);

  @override
  State<RocketDetailView> createState() => _RocketDetailViewState();
}

class _RocketDetailViewState extends State<RocketDetailView> {
  late Rocket? rocket;

  @override
  void initState() {
    rocket = null;
    if (widget.rocket != null) {
      rocket = widget.rocket!;
    }
    if (widget.rocketId != null) {
      getData();
    }
    super.initState();
  }

  Future getData() async {
    Rocket r = await RocketRepository().getRocketById(widget.rocketId!);
    setState(() {
      rocket = r;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldLayout(
      body: _body(),
      appBar: AppBar(
        title: Text(rocket?.name ?? ""),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        AppRowItem(title: "Name:", value: rocket?.name),
        AppRowItem(title: "Commpany:", value: rocket?.company),
        AppRowItem(title: "Height [m]:", value: rocket?.height != null ? rocket?.height!.meters.toString() : null),
        AppRowItem(title: "Country:", value: rocket?.country),
        AppRowItem(title: "Active:", value: rocket?.active.toString()),
        AppRowItem(title: "Type:", value: rocket?.type),
        AppRowItem(title: "Description:", value: rocket?.description),
      ],
    );
  }
}
