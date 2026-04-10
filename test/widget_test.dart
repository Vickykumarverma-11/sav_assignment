import 'package:flutter_test/flutter_test.dart';

import 'package:sav_assignment/main.dart';

void main() {
  testWidgets('StockApp renders without error', (WidgetTester tester) async {
    await tester.pumpWidget(const StockApp());
    expect(find.text('Markets Open'), findsOneWidget);
  });
}
