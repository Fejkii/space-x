import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/app/dependency_injection.dart';
import 'package:space_x/const/app_strings.dart';
import 'package:space_x/const/app_values.dart';
import 'package:space_x/cubit/rocket/rocket_cubit.dart';
import 'package:space_x/model/rocket_model.dart';
import 'package:space_x/ui/rocket/rocket_detail_view.dart';
import 'package:space_x/ui/widgets/app_list_view.dart';
import 'package:space_x/ui/widgets/app_loading_indicator.dart';
import 'package:space_x/ui/widgets/app_scaffold_layout.dart';
import 'package:space_x/ui/widgets/app_text_styles.dart';
import 'package:space_x/ui/widgets/app_toast_message.dart';

class RocketListView extends StatefulWidget {
  const RocketListView({super.key});

  @override
  State<RocketListView> createState() => _RocketListViewState();
}

class _RocketListViewState extends State<RocketListView> {
  RocketCubit rocketCubit = instance<RocketCubit>();
  late List<Rocket> rocketList;

  @override
  void initState() {
    rocketList = [];
    _getData();
    super.initState();
  }

  void _getData() {
    rocketCubit.getRocketList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RocketCubit, RocketState>(
      builder: (context, state) {
        return AppScaffoldLayout(
          appBar: AppBar(
            title: const Text(AppStrings.rockets),
          ),
          body: _body(),
        );
      },
    );
  }

  Widget _body() {
    return BlocConsumer<RocketCubit, RocketState>(
      listener: (context, state) {
        if (state is RocketListSuccessState) {
          rocketList = state.rocketList;
        } else if (state is RocketFailureState) {
          AppToastMessage().showToastMsg(state.errorMessage, ToastStates.error);
        }
      },
      builder: (BuildContext context, RocketState state) {
        if (state is RocketLoadingState) {
          return const AppLoadingIndicator();
        } else {
          return _list();
        }
      },
    );
  }

  Widget _list() {
    return AppListView(
      listData: rocketList,
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
          AppTitleText(text: rocketList[index].name ?? ""),
          AppText(text: rocketList[index].description ?? ""),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RocketDetailView(rocket: rocketList[index]),
          ),
        ).then((_) => _getData());
      },
    );
  }
}
