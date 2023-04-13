import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:space_x/const/app_strings.dart';
import 'package:space_x/ui/home_view.dart';

void main() {
  testWidgets('Home bottomNavigationBar test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeView()));

    expect(find.text(AppStrings.launches), findsOneWidget);
    expect(find.byIcon(Icons.rocket_launch), findsOneWidget);
    expect(find.text(AppStrings.company), findsOneWidget);
    expect(find.byIcon(Icons.info_outline), findsOneWidget);
  });
}
