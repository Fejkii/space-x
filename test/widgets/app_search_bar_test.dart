import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:space_x/ui/widgets/app_search_bar.dart';

void main() {
  List<String> itemList = ["Item 1", "Item 2", "Item 3"];

  testWidgets(
    'Widget AppSearchBar test',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppSearchBar(
            title: "App SearchBar",
            suggestions: itemList,
            onSuggestionTap: (item) {},
          ),
        ),
      );
      expect(find.text("App SearchBar"), findsOneWidget);
    },
  );
}
