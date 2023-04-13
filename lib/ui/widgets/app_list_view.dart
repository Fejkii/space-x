import 'package:flutter/material.dart';
import 'package:space_x/const/app_values.dart';

class AppListView extends StatelessWidget {
  final List listData;
  final IndexedWidgetBuilder itemBuilder;
  final Future<void> Function()? onRefresh;
  AppListView({
    Key? key,
    required this.listData,
    required this.itemBuilder,
    this.onRefresh,
  }) : super(key: key);

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async {
          print("test");
        },
        color: Colors.red,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: listData.length,
          itemBuilder: itemBuilder,
        ));
  }
}

class AppListViewItem extends StatelessWidget {
  final Widget itemBody;
  final Function()? onTap;
  const AppListViewItem({
    Key? key,
    required this.itemBody,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: Center(
            heightFactor: 1.2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
              child: itemBody,
            ),
          ),
        ),
      ),
    );
  }
}
