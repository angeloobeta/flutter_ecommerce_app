import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/cart_item.dart';

class CartProvider extends StatefulWidget {
  final Widget child;

  const CartProvider({super.key, required this.child});

  @override
  _CartProviderState createState() => _CartProviderState();

  static CartInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CartInherited>();
  }
}

class _CartProviderState extends State<CartProvider> {
  final List<CartItem> _cartItems = [];

  void addToCart(Product product) {
    if (!isProductInCart(product.id)) {
      setState(() {
        _cartItems.add(CartItem(product: product));
      });
    }
  }

  final List<String> _favoriteProductIds = [];

  List<String> get favoriteProductIds => _favoriteProductIds;

  bool isFavorite(String productId) {
    return _favoriteProductIds.contains(productId);
  }

  void toggleFavorite(String productId) {
    setState(() {
      if (_favoriteProductIds.contains(productId)) {
        _favoriteProductIds.remove(productId);
      } else {
        _favoriteProductIds.add(productId);
      }
    });
  }

  int get totalFavorites => _favoriteProductIds.length;

  bool isProductInCart(String productId) {
    return _cartItems.any((item) => item.product.id == productId);
  }

  void removeProductFromCart(String productId) {
    setState(() {
      _cartItems.removeWhere((item) => item.product.id == productId);
    });
  }

  void removeFromCart(String cartItemId) {
    setState(() {
      _cartItems.removeWhere((item) => item.id == cartItemId);
    });
  }

  void updateQuantity(String cartItemId, int quantity) {
    final index = _cartItems.indexWhere((item) => item.id == cartItemId);
    if (index >= 0) {
      if (quantity <= 0) {
        removeFromCart(cartItemId);
      } else {
        setState(() {
          _cartItems[index].quantity = quantity;
        });
      }
    }
  }

  int get totalItems {
    return _cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

  double get totalPrice {
    return _cartItems.fold(
        0.0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  @override
  Widget build(BuildContext context) {
    return CartInherited(
      cartItems: _cartItems,
      addToCart: addToCart,
      removeFromCart: removeFromCart,
      removeProductFromCart: removeProductFromCart,
      updateQuantity: updateQuantity,
      isProductInCart: isProductInCart,
      totalItems: totalItems,
      totalPrice: totalPrice,
      favoriteProductIds: _favoriteProductIds,
      isFavorite: isFavorite,
      toggleFavorite: toggleFavorite,
      totalFavorites: totalFavorites,
      child: widget.child,
    );
  }
}

class CartInherited extends InheritedWidget {
  final List<CartItem> cartItems;
  final Function(Product) addToCart;
  final Function(String) removeFromCart;
  final Function(String) removeProductFromCart;
  final Function(String, int) updateQuantity;
  final Function(String) isProductInCart;
  final int totalItems;
  final double totalPrice;

  // Add favorites
  final List<String> favoriteProductIds;
  final Function(String) isFavorite;
  final Function(String) toggleFavorite;
  final int totalFavorites;

  const CartInherited({
    super.key,
    required this.cartItems,
    required this.addToCart,
    required this.removeFromCart,
    required this.removeProductFromCart,
    required this.updateQuantity,
    required this.isProductInCart,
    required this.totalItems,
    required this.totalPrice,
    required this.favoriteProductIds,
    required this.isFavorite,
    required this.toggleFavorite,
    required this.totalFavorites,
    required super.child,
  });

  @override
  bool updateShouldNotify(CartInherited old) {
    return cartItems != old.cartItems ||
        totalItems != old.totalItems ||
        totalPrice != old.totalPrice ||
        favoriteProductIds != old.favoriteProductIds ||
        totalFavorites != old.totalFavorites;
  }
}
