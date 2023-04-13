import 'package:flutter/material.dart';

class AppLoadingIndicator extends StatelessWidget {
  final double? value;
  const AppLoadingIndicator({
    Key? key,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        value: value,
      ),
    );
  }
}
