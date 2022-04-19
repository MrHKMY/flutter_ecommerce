import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product(
      {required this.name,
      required this.category,
      required this.imageUrl,
      required this.price,
      required this.isRecommended,
      required this.isPopular});

  @override
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        price,
        isPopular,
        isRecommended,
      ];

  static List<Product> products = [
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
    Product(
        name: "Smoothies #3",
        category: "Smoothies",
        imageUrl:
            'https://images.unsplash.com/photo-1557799852-67fdf88b1b01?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
        price: 3.99,
        isRecommended: true,
        isPopular: true),
    Product(
        name: "Smoothies #4",
        category: "Smoothies",
        imageUrl:
            'https://images.unsplash.com/photo-1557799852-67fdf88b1b01?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
        price: 4.99,
        isRecommended: false,
        isPopular: true),
    Product(
        name: "Soft Drink #1",
        category: "Soft Drink",
        imageUrl:
            'https://images.unsplash.com/photo-1527960471264-932f39eb5846?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
        price: 1.99,
        isRecommended: true,
        isPopular: false),
    Product(
        name: "Soft Drink #2",
        category: "Soft Drink",
        imageUrl:
            'https://images.unsplash.com/photo-1527960471264-932f39eb5846?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
        price: 2.99,
        isRecommended: false,
        isPopular: true),
  ];
}
