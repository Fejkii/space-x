import 'package:flutter/material.dart';
import 'package:space_x/app/app_preferences.dart';
import 'package:space_x/app/dependency_injection.dart';
import 'package:space_x/const/app_strings.dart';
import 'package:space_x/const/app_values.dart';
import 'package:space_x/ui/launch/launch_enum.dart';

class LaunchFilterDialog extends StatefulWidget {
  const LaunchFilterDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<LaunchFilterDialog> createState() => _LaunchFilterDialogState();
}

class _LaunchFilterDialogState extends State<LaunchFilterDialog> {
  late LaunchSearchBy searchBy;
  late LaunchSortBy sortBy;
  late SortType sortType;
  late List<String> launchAccordingList;

  @override
  void initState() {
    searchBy = instance<AppPreferences>().getLaunchSearchBy();
    sortBy = instance<AppPreferences>().getLaunchSortBy();
    sortType = instance<AppPreferences>().getLaunchSortType();
    launchAccordingList = LaunchSortBy.values.map((e) => e.getTitle()).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(AppStrings.launchFilter, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            const Divider(height: AppPadding.p20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(AppStrings.searchBy, style: TextStyle(fontSize: 14)),
                const SizedBox(width: AppPadding.p10),
                DropdownButton<LaunchSearchBy>(
                  value: searchBy,
                  items: LaunchSearchBy.values.map((LaunchSearchBy value) {
                    return DropdownMenuItem<LaunchSearchBy>(
                      value: value,
                      child: Text(value.getTitle()),
                    );
                  }).toList(),
                  onChanged: (LaunchSearchBy? value) {
                    setState(() {
                      searchBy = value!;
                    });
                  },
                ),
              ],
            ),
            const Divider(height: AppPadding.p20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(AppStrings.orderBy, style: TextStyle(fontSize: 14)),
                const SizedBox(width: AppPadding.p10),
                DropdownButton<LaunchSortBy>(
                  value: sortBy,
                  items: LaunchSortBy.values.map((LaunchSortBy value) {
                    return DropdownMenuItem<LaunchSortBy>(
                      value: value,
                      child: Text(value.getTitle()),
                    );
                  }).toList(),
                  onChanged: (LaunchSortBy? value) {
                    setState(() {
                      sortBy = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: AppPadding.p10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(AppStrings.sortType, style: TextStyle(fontSize: 14)),
                const SizedBox(width: AppPadding.p10),
                DropdownButton<SortType>(
                  value: sortType,
                  items: SortType.values.map((SortType value) {
                    return DropdownMenuItem<SortType>(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                  onChanged: (SortType? value) {
                    setState(() {
                      sortType = value!;
                    });
                  },
                ),
              ],
            ),
            const Divider(height: AppPadding.p20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    instance<AppPreferences>().setLaunchSearchBy(searchBy);
                    instance<AppPreferences>().setLaunchSortBy(sortBy);
                    instance<AppPreferences>().setLaunchSortType(sortType);
                    Navigator.of(context).pop(true);
                  },
                  child: const Text(AppStrings.save),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text(AppStrings.cancel),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
