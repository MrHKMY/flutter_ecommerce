import 'package:e_commerce/model/models.dart';
import 'package:e_commerce/widgets/custom_appbar.dart';
import 'package:e_commerce/widgets/custom_navbar.dart';
import 'package:e_commerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OrderConfirmation extends StatelessWidget {
  static const String routeName = '/order-confirmation';
  const OrderConfirmation({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => OrderConfirmation());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Order Confirmation"),
        bottomNavigationBar: CustomNavBar(screen: routeName),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              color: Colors.black,
              width: double.infinity,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your order is complete",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.white),
                  ),
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Text(
                  "ORDER CODE: #12345",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Thanks for your purchase",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "ORDER CODE: #12345",
                  style: Theme.of(context).textTheme.headline5,
                ),
                OrderSummary(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "ORDER DETAILS",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 5,
                ),
                ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    OrderSummaryCard(
                      product: Product.products[5],
                      quantity: 1,
                    ),
                    OrderSummaryCard(
                      product: Product.products[3],
                      quantity: 3,
                    )
                  ],
                )
              ]),
            )
          ]),
        ));
  }
}
