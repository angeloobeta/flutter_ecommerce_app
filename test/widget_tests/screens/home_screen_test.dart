import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ecommerce_app/screens/home_screen.dart';
import 'package:flutter_ecommerce_app/providers/cart_provider.dart';

void main() {
  group('HomeScreen Widget Tests', () {
    testWidgets('should display product grid', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CartProvider(
            child: HomeScreen(),
          ),
        ),
      );

      expect(find.text('Technology'), findsOneWidget);
      expect(find.text('Smartphones, Laptops & Assecories'), findsOneWidget);
      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('should have search field', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CartProvider(
            child: HomeScreen(),
          ),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Search...'), findsOneWidget);
    });
  });
}
