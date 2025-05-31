import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ecommerce_app/models/product.dart';

void main() {
  group('Product Model Tests', () {
    test('should create product from json', () {
      final json = {
        'id': '1',
        'name': 'Test Product',
        'price': 99.99,
        'image': '📱',
        'description': 'Test description'
      };

      final product = Product.fromJson(json);

      expect(product.id, '1');
      expect(product.name, 'Test Product');
      expect(product.price, 99.99);
      expect(product.image, '📱');
      expect(product.description, 'Test description');
    });

    test('should convert product to json', () {
      final product = Product(
        id: '1',
        name: 'Test Product',
        price: 99.99,
        image: '📱',
        description: 'Test description',
      );

      final json = product.toJson();

      expect(json['id'], '1');
      expect(json['name'], 'Test Product');
      expect(json['price'], 99.99);
      expect(json['image'], '📱');
      expect(json['description'], 'Test description');
    });
  });
}
