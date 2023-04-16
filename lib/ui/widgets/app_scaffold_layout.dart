import 'package:flutter/material.dart';
import 'package:space_x/const/app_values.dart';

class AppScaffoldLayout extends StatefulWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  const AppScaffoldLayout({
    Key? key,
    required this.body,
    this.appBar,
  }) : super(key: key);

  @override
  State<AppScaffoldLayout> createState() => _AppScaffoldLayoutState();
}

class _AppScaffoldLayoutState extends State<AppScaffoldLayout> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: widget.appBar,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: AppPadding.p10),
              widget.body,
            ],
          ),
        ),
      ),
    );
  }
}
