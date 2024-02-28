import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:tddapp/features/login/presentation/login_page.dart';
import 'package:tddapp/main.dart';

void main() {
  testWidgets('Main File Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(GetMaterialApp), findsOneWidget);
    expect(find.text('TDD Application'), findsOneWidget);
    expect(find.byType(LoginPage), findsOneWidget);
  });
}
