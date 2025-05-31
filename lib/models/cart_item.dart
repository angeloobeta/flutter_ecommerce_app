import 'product.dart';

class CartItem {
  final String id;
  final Product product;
  int quantity;

  CartItem({
    String? id,
    required this.product,
    this.quantity = 1,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch.toString();
}
