import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/app/app_preferences.dart';
import 'package:space_x/app/dependency_injection.dart';
import 'package:space_x/const/app_strings.dart';
import 'package:space_x/const/app_values.dart';
import 'package:space_x/cubit/launch/launch_cubit.dart';
import 'package:space_x/model/launch_model.dart';
import 'package:space_x/ui/launch/launch_detail_view.dart';
import 'package:space_x/ui/launch/launch_enum.dart';
import 'package:space_x/ui/launch/launch_filter_dialog.dart';
import 'package:space_x/ui/widgets/app_list_view.dart';
import 'package:space_x/ui/widgets/app_loading_indicator.dart';
import 'package:space_x/ui/widgets/app_scaffold_layout.dart';
import 'package:space_x/ui/widgets/app_search_bar.dart';
import 'package:space_x/ui/widgets/app_text_styles.dart';
import 'package:space_x/ui/widgets/app_toast_message.dart';

class LaunchListView extends StatefulWidget {
  const LaunchListView({super.key});

  @override
  State<LaunchListView> createState() => _LaunchListViewState();
}

class _LaunchListViewState extends State<LaunchListView> {
  final LaunchCubit launchCubit = instance<LaunchCubit>();
  late List<Launch> launches;
  late LaunchSegment selectedSegment;
  late LaunchSearchBy searchBy;
  late List<String>? searchList;

  late String searchValue = "";

  @override
  void initState() {
    selectedSegment = instance<AppPreferences>().getLaunchSegment();
    searchBy = instance<AppPreferences>().getLaunchSearchBy();
    launches = [];
    _getData();
    super.initState();
  }

  void _getData() {
    if (selectedSegment == LaunchSegment.upcoming) {
      launchCubit.getLaunchList(selectedSegment);
    } else {
      launchCubit.getFilteredLaunchList(
        selectedSegment,
        instance<AppPreferences>().getLaunchSortBy(),
        instance<AppPreferences>().getLaunchSortType(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaunchCubit, LaunchState>(
      builder: (context, state) {
        return AppScaffoldLayout(
          appBar: _searchBar(),
          body: _body(),
        );
      },
    );
  }

  Widget _segmentedControl() {
    return CupertinoSegmentedControl(
      unselectedColor: Colors.white,
      selectedColor: Colors.blue,
      borderColor: Colors.grey,
      groupValue: selectedSegment,
      padding: const EdgeInsets.only(bottom: AppPadding.p10),
      children: const <LaunchSegment, Widget>{
        LaunchSegment.upcoming: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: Text(AppStrings.upcoming),
        ),
        LaunchSegment.past: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: Text(AppStrings.past),
        ),
      },
      onValueChanged: (LaunchSegment? value) {
        if (value != null) {
          setState(() {
            selectedSegment = value;
          });
          instance<AppPreferences>().setLaunchSegment(selectedSegment);
          _getData();
        }
      },
    );
  }

  PreferredSizeWidget _searchBar() {
    if (searchBy == LaunchSearchBy.name) {
      searchList = launches.map((e) => e.name).toList();
    } else {
      searchList = launches.map((e) => e.flightNumber.toString()).toList();
    }
    return AppSearchBar(
      title: AppStrings.launches,
      leading: selectedSegment == LaunchSegment.past
          ? IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const LaunchFilterDialog();
                  },
                ).then((value) => (value == true) ? _getData() : null);
              },
              icon: const Icon(
                Icons.filter_alt_outlined,
                color: Colors.white,
              ),
            )
          : null,
      suggestions: searchList,
      onSuggestionTap: (searchValue) {
        Launch launch;
        if (searchBy == LaunchSearchBy.name) {
          launch = launches.firstWhere((element) => element.name.contains(searchValue));
        } else {
          launch = launches.firstWhere((element) => element.flightNumber.toString().contains(searchValue));
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LaunchDetailView(launch: launch),
          ),
        ).then((_) => _getData());
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
          return Column(
            children: [
              _segmentedControl(),
              _list(),
            ],
          );
        }
      },
    );
  }

  Widget _list() {
    return AppListView(
      listData: launches,
      itemBuilder: _itemBuilder,
      onRefresh: () async {
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
