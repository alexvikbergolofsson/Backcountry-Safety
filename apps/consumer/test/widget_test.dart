import 'package:flutter_test/flutter_test.dart';
import 'package:consumer/main.dart';

void main() {
  testWidgets('Stability Monitor smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the UI contains the expected text.
    expect(find.text('Stability Confidence level:'), findsOneWidget);
    expect(find.text('High'), findsOneWidget);
  });
}
