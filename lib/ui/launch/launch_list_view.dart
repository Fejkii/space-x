import 'package:flutter/material.dart';
import 'package:space_x/app/api_factory.dart';
import 'package:space_x/model/launch_model.dart';
import 'package:space_x/ui/widgets/app_list_view.dart';
import 'package:space_x/ui/widgets/app_scaffold_layout.dart';
import 'package:space_x/ui/widgets/app_text_styles.dart';

class LaunchListView extends StatefulWidget {
  const LaunchListView({super.key});

  @override
  State<LaunchListView> createState() => _LaunchListViewState();
}

class _LaunchListViewState extends State<LaunchListView> {
  late List<Launch> launches;

  @override
  void initState() {
    launches = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldLayout(
      appBar: AppBar(),
      body: FutureBuilder(
        future: ApiFactory().getLaunches(),
        builder: (BuildContext context, AsyncSnapshot<List<Launch>> snapshot) {
          if (snapshot.hasData) {
            launches = snapshot.data!;
            return AppListView(
              listData: launches,
              itemBuilder: _itemBuilder,
              onRefresh: () {
                return ApiFactory().getLaunches();
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return AppListViewItem(
      itemBody: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppTitleText(text: launches[index].name),
          AppText(text: launches[index].details ?? ""),
        ],
      ),
      onTap: () {
        print(launches[index].name);
      },
    );
  }
}
