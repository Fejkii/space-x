import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/app/dependency_injection.dart';
import 'package:space_x/const/app_values.dart';
import 'package:space_x/cubit/rocket/rocket_cubit.dart';
import 'package:space_x/model/rocket_model.dart';
import 'package:space_x/ui/widgets/app_loading_indicator.dart';
import 'package:space_x/ui/widgets/app_row_item.dart';
import 'package:space_x/ui/widgets/app_scaffold_layout.dart';
import 'package:space_x/ui/widgets/app_toast_message.dart';

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
  RocketCubit rocketCubit = instance<RocketCubit>();
  late Rocket? rocket;

  @override
  void initState() {
    rocket = null;
    if (widget.rocket != null) {
      rocket = widget.rocket!;
    }
    if (widget.rocketId != null) {
      _getData(widget.rocketId!);
    }
    super.initState();
  }

  void _getData(String rocketId) {
    rocketCubit.getRocket(rocketId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RocketCubit, RocketState>(
      builder: (context, state) {
        return AppScaffoldLayout(
          body: _body(),
          appBar: AppBar(
            title: Text(rocket?.name ?? ""),
          ),
        );
      },
    );
  }

  Widget _body() {
    return BlocConsumer<RocketCubit, RocketState>(
      listener: (context, state) {
        if (state is RocketSuccessState) {
          rocket = state.rocket;
        } else if (state is RocketFailureState) {
          AppToastMessage().showToastMsg(state.errorMessage, ToastStates.error);
        }
      },
      builder: (BuildContext context, RocketState state) {
        if (state is RocketLoadingState) {
          return const AppLoadingIndicator();
        } else {
          return _rocket();
        }
      },
    );
  }

  Widget _rocket() {
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
