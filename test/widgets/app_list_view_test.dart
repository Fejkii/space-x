import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:space_x/ui/widgets/app_list_view.dart';

void main() {
  List<String> itemList = ["Item 1", "Item 2", "Item 3"];

  Widget itemBuilder(BuildContext context, int index) {
    return AppListViewItem(
      itemBody: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(itemList[index].toString())],
      ),
    );
  }

  testWidgets('Widget AppListView test', (WidgetTester tester) async {
    int n = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: AppListView(
          listData: [itemList],
          itemBuilder: itemBuilder,
        ),
      ),
    );

    //find all text widgets
    List<Widget> list = tester.widgetList(find.byType(Text)).toList();

    //verify
    for (var element in list) {
      expect(element.toString().contains(itemList[n]), true, reason: "Not found");
      n += 1;
    }
  });
}
