import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/model/models.dart';
import 'package:e_commerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Home Page"),
      bottomNavigationBar: CustomNavBar(),
      body: Column(
        children: [
          Expanded(
            child: Container(
                child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: Category.categories
                  .map((category) => HeroCarousel(category: category))
                  .toList(),
            )),
          ),
          SectionTitle(title: "RECOMMENDED"),
          //ProductCard(product: Product.products[0],),
          ProductCarousel(
              products: Product.products
                  .where((product) => product.isRecommended)
                  .toList()),

          SectionTitle(title: "MOST POPULAR"),
          //ProductCard(product: Product.products[0],),
          ProductCarousel(
              products: Product.products
                  .where((product) => product.isPopular)
                  .toList()),
        ],
      ),
    );
  }
}
