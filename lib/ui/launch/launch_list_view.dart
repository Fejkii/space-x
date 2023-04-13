import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/app/dependency_injection.dart';
import 'package:space_x/const/app_strings.dart';
import 'package:space_x/const/app_values.dart';
import 'package:space_x/cubit/launch/launch_cubit.dart';
import 'package:space_x/model/launch_model.dart';
import 'package:space_x/ui/launch/launch_detail_view.dart';
import 'package:space_x/ui/launch/launch_enum.dart';
import 'package:space_x/ui/widgets/app_list_view.dart';
import 'package:space_x/ui/widgets/app_loading_indicator.dart';
import 'package:space_x/ui/widgets/app_scaffold_layout.dart';
import 'package:space_x/ui/widgets/app_text_styles.dart';
import 'package:space_x/ui/widgets/app_toast_message.dart';

class LaunchListView extends StatefulWidget {
  const LaunchListView({super.key});

  @override
  State<LaunchListView> createState() => _LaunchListViewState();
}

class _LaunchListViewState extends State<LaunchListView> {
  LaunchCubit launchCubit = instance<LaunchCubit>();
  late List<Launch> launches;
  LaunchEnum _selectedSegment = LaunchEnum.upcoming;

  @override
  void initState() {
    launches = [];
    _getData();
    super.initState();
  }

  void _getData() {
    launchCubit.getLaunchList(_selectedSegment);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaunchCubit, LaunchState>(
      builder: (context, state) {
        return AppScaffoldLayout(
          appBar: AppBar(
            title: _segmentedControl(),
          ),
          body: _body(),
        );
      },
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
          _getData();
          setState(() {
            _selectedSegment = value;
          });
        }
      },
    );
  }

  Widget _body() {
    return BlocConsumer<LaunchCubit, LaunchState>(
      listener: (context, state) {
        if (state is LaunchListSuccessState) {
          launches = state.launchList;
        } else if (state is LaunchFailureState) {
          AppToastMessage().showToastMsg(state.errorMessage, ToastStates.error);
        }
      },
      builder: (BuildContext context, LaunchState state) {
        if (state is LaunchLoadingState) {
          return const AppLoadingIndicator();
        } else {
          return _list();
        }
      },
    );
  }

  Widget _list() {
    return AppListView(
      listData: launches,
      itemBuilder: _itemBuilder,
      onRefresh: () async {
        print("TODO");
        _getData();
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
        ).then((_) => _getData());
      },
    );
  }
}
