import 'package:flutter/material.dart';
import 'package:space_x/const/app_values.dart';
import 'package:space_x/ui/widgets/app_text_styles.dart';

class AppRowItem extends StatelessWidget {
  final String title;
  final String? value;
  const AppRowItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppTitleText(text: title),
        const SizedBox(width: AppPadding.p10),
        Expanded(
          child: AppText(text: value ?? ""),
        ),
      ],
    );
  }
}
