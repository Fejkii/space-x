import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  const AppText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 10,
      ),
    );
  }
}

class AppTitleText extends StatelessWidget {
  final String text;
  const AppTitleText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
