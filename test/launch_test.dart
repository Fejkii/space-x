import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:space_x/const/app_strings.dart';
import 'package:space_x/ui/launch/launch_list_view.dart';

void main() {
  testWidgets('LaunchListView segmentedControl test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LaunchListView()));

    var upcoming = find.text(AppStrings.upcoming);
    expect(upcoming, findsOneWidget);
    await tester.tap(upcoming);
    var past = find.text(AppStrings.past);
    expect(past, findsOneWidget);
    await tester.tap(past);
  });
}
