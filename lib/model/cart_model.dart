import 'package:equatable/equatable.dart';
import 'package:e_commerce/model/product_model.dart';

class Cart extends Equatable {
  Cart();

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFee(subtotal) {
    if (subtotal >= 30) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 30) {
      return "You have Free Delivery";
    } else {
      double missing = 30.0 - subtotal;
      return "Add \$${missing.toStringAsFixed(2)} for FREE Delivery";
    }
  }

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subtotal);

  List<Product> products = [
    Product(
        name: "Smoothies #1",
        category: "Smoothies",
        imageUrl:
            'https://images.unsplash.com/photo-1557799852-67fdf88b1b01?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
        price: 1.99,
        isRecommended: true,
        isPopular: false),
    Product(
        name: "Smoothies #2",
        category: "Smoothies",
        imageUrl:
            'https://images.unsplash.com/photo-1557799852-67fdf88b1b01?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
        price: 2.99,
        isRecommended: false,
        isPopular: false),
  ];

  @override
  List<Object?> get props => [];
}
