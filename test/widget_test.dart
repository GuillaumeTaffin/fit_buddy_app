import 'package:fit_buddy_app/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const FitBuddyApp());
    expect(find.text('HOME'), findsOneWidget);
  });

  test('Some test', () => expect(1 + 2, 3));
}
