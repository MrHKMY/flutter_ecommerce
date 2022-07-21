import 'package:e_commerce/blocs/blocs.dart';
import 'package:e_commerce/model/models.dart';
import 'package:e_commerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => CatalogScreen(category: category));
  }

  final Category category;

  const CatalogScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProduct = Product.products
        .where((element) => element.category == category.name)
        .toList();
    return Scaffold(
        appBar: CustomAppBar(title: category.name),
        bottomNavigationBar: CustomNavBar(screen: routeName),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductLoaded) {
              return GridView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 16.0,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1.15),
                  itemCount: state.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                        child: ProductCard(
                      product: state.products[index],
                      widthFactor: 2.2,
                    ));
                  });
            } else {
              return Text("Something went wrong");
            }
          },
        ));
  }
}
