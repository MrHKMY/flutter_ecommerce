import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/blocs/category/category_bloc.dart';
import 'package:e_commerce/blocs/product/product_bloc.dart';
import 'package:e_commerce/model/models.dart';
import 'package:e_commerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            child: Container(child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is CategoryLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                    ),
                    items: state.categories
                        .map((category) => HeroCarousel(category: category))
                        .toList(),
                  );
                } else {
                  return Text("Something went wrong");
                }
              },
            )),
          ),
          SectionTitle(title: "RECOMMENDED"),
          //ProductCard(product: Product.products[0],),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductLoaded) {
                return ProductCarousel(
                    products: state.products
                        .where((product) => product.isRecommended)
                        .toList());
              } else {
                return Text("Something went wrong");
              }
            },
          ),

          SectionTitle(title: "MOST POPULAR"),
          //ProductCard(product: Product.products[0],),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductLoaded) {
                return ProductCarousel(
                    products: state.products
                        .where((product) => product.isPopular)
                        .toList());
              } else {
                return Text("Something went wrong");
              }
            },
          ),
        ],
      ),
    );
  }
}
