import 'package:e_commerce/model/models.dart';
import 'package:e_commerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => WishlistScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Wishlist Page"),
      bottomNavigationBar: CustomNavBar(),
      body: GridView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 16.0,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, childAspectRatio: 2.4),
          itemCount: Product.products.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
                child: ProductCard(
              product: Product.products[index],
              widthFactor: 1.1,
              leftPosition: 100,
              isWishlist: true,
            ));
          }),
    );
  }
}
