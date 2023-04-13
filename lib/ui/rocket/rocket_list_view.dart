import 'package:flutter/material.dart';
import 'package:space_x/const/app_strings.dart';
import 'package:space_x/model/rocket_model.dart';
import 'package:space_x/repository/rocket_repository.dart';
import 'package:space_x/ui/rocket/rocket_detail_view.dart';
import 'package:space_x/ui/widgets/app_list_view.dart';
import 'package:space_x/ui/widgets/app_scaffold_layout.dart';
import 'package:space_x/ui/widgets/app_text_styles.dart';

class RocketListView extends StatefulWidget {
  const RocketListView({super.key});

  @override
  State<RocketListView> createState() => _RocketListViewState();
}

class _RocketListViewState extends State<RocketListView> {
  late List<Rocket> rockets;

  @override
  void initState() {
    rockets = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldLayout(
      appBar: AppBar(
        title: const Text(AppStrings.rockets),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return FutureBuilder(
      future: RocketRepository().getRockets(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          rockets = snapshot.data!;
          return AppListView(
            listData: rockets,
            itemBuilder: _itemBuilder,
            onRefresh: () async {
              print("TODO");
              // TODO
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return AppListViewItem(
      itemBody: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppTitleText(text: rockets[index].name ?? ""),
          AppText(text: rockets[index].description ?? ""),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RocketDetailView(rocket: rockets[index]),
          ),
        );
      },
    );
  }
}
