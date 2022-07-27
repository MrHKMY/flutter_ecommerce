import 'dart:io';

import 'package:e_commerce/widgets/custom_appbar.dart';
import 'package:e_commerce/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class PaymentSelection extends StatelessWidget {
  static const String routeName = '/payment_selection';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => PaymentSelection());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Payment Selection"),
      //bottomNavigationBar: CustomNavBar(screen: routeName),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Platform.isAndroid
              ? RawGooglePayButton(
                  style: GooglePayButtonStyle.black,
                  type: GooglePayButtonType.pay,
                  onPressed: () {
                    print("Google pay selected");
                  },
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
