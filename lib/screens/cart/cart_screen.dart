import 'package:e_commerce/blocs/cart/cart_bloc.dart';
import 'package:e_commerce/model/cart_model.dart';
import 'package:e_commerce/model/models.dart';
import 'package:e_commerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => CartScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Cart"),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Text(
                    "CHECKOUT",
                    style: Theme.of(context).textTheme.headline3!,
                  ))
            ],
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CartLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.cart.freeDeliveryString,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/');
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(),
                                  elevation: 0),
                              child: Text(
                                "Add more items",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.white),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 385,
                        child: ListView.builder(
                            itemCount: state.cart.products.length,
                            itemBuilder: (context, index) {
                              return CartProductCard(
                                  product: state.cart.products[index]);
                            }),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "SUBTOTAL",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                Text(
                                  "\$${state.cart.subtotalString}",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "DELIVERY FEE",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                Text(
                                  "\$${state.cart.deliveryFeeString}",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(50),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.all(5.0),
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.black,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "TOTAL",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: Colors.white),
                                  ),
                                  Text("\$${state.cart.totalString}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Text("Something went wrong");
          }
        },
      ),
    );
  }
}
