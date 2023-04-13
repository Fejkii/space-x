import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:space_x/const/app_strings.dart';
import 'package:space_x/ui/rocket/rocket_list_view.dart';

void main() {
  testWidgets("RocketListView test", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: RocketListView()));

    expect(find.text(AppStrings.rockets), findsOneWidget);
  });
}
