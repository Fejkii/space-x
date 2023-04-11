import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_x/app/api_factory.dart';
import 'package:space_x/const/app_strings.dart';
import 'package:space_x/const/app_values.dart';
import 'package:space_x/model/launch_model.dart';
import 'package:space_x/ui/launch/launch_detail_view.dart';
import 'package:space_x/ui/launch/launch_enum.dart';
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
  LaunchEnum _selectedSegment = LaunchEnum.upcoming;

  @override
  void initState() {
    launches = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldLayout(
      appBar: AppBar(
        title: _segmentedControl(),
      ),
      body: _body(),
    );
  }

  Widget _segmentedControl() {
    return CupertinoSegmentedControl(
      unselectedColor: Colors.white,
      selectedColor: Colors.blue,
      borderColor: Colors.white,
      groupValue: _selectedSegment,
      children: const <LaunchEnum, Widget>{
        LaunchEnum.upcoming: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: Text(AppStrings.upcoming),
        ),
        LaunchEnum.past: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: Text(AppStrings.past),
        ),
      },
      onValueChanged: (LaunchEnum? value) {
        if (value != null) {
          setState(() {
            _selectedSegment = value;
          });
        }
      },
    );
  }

  Widget _body() {
    return FutureBuilder(
      future: ApiFactory().getLaunches(_selectedSegment),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          launches = snapshot.data!;
          return AppListView(
              listData: launches,
              itemBuilder: _itemBuilder,
              onRefresh: () async {
                await ApiFactory().getLaunches(_selectedSegment);
              });
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
          AppTitleText(text: launches[index].name),
          AppText(text: launches[index].details ?? ""),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LaunchDetailView(launch: launches[index]),
          ),
        );
      },
    );
  }
}
