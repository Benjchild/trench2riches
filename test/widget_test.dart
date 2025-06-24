import 'package:flutter_test/flutter_test.dart';
import 'package:trench2richies/main.dart'; // Make sure this matches your actual main.dart file

void main() {
  testWidgets('Basic home screen loads and UI test',
      (WidgetTester tester) async {
    await tester.pumpWidget(const Trench2RichesApp());

    // Check for homepage content
    expect(find.text('TRENCHES 2 RICHES'), findsOneWidget);

    // Check if the floating chat button exists
    expect(find.text("Let's Chat!"), findsOneWidget);
  });
}
