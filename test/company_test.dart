import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:space_x/const/app_strings.dart';
import 'package:space_x/ui/company/company_view.dart';

void main() {
  testWidgets('CompanyView test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CompanyView()));

    expect(find.text(AppStrings.company), findsOneWidget);
  });
}
