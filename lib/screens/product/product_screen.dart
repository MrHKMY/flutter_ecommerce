import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/blocs/cart/cart_bloc.dart';
import 'package:e_commerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/model/wishlist_model.dart';
import 'package:e_commerce/model/wishlist_model.dart';
import 'package:e_commerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => ProductScreen(product: product));
  }

  final Product product;

  const ProductScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  )),
              BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
                  return IconButton(
                      onPressed: () {
                        context
                            .read<WishlistBloc>()
                            .add(WishlistProductAdded(product));

                        final snackBar =
                            SnackBar(content: Text("Added to Wishlist"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ));
                },
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return ElevatedButton(
                      onPressed: () {
                        context.read<CartBloc>().add(CartProductAdded(product));
                        //TODO not necessary navigator
                        Navigator.pushNamed(context, '/cart');
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      child: Text(
                        "ADD TO CART",
                        style: Theme.of(context).textTheme.headline3!,
                      ));
                },
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: [
                HeroCarousel(
                  product: product,
                ),
              ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  color: Colors.black.withAlpha(50),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          'RM ${product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text("Product Information",
                  style: Theme.of(context).textTheme.headline3),
              children: [
                ListTile(
                  title: Text(
                    "The product information goes here with a long non-read sentences",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              title: Text("Delivery Information",
                  style: Theme.of(context).textTheme.headline3),
              children: [
                ListTile(
                  title: Text(
                    "The delivery information goes here",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
