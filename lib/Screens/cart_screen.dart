import 'package:flutter/material.dart';
import 'package:login_ui_firebase_auth/Components/cart_product_card.dart';


class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(children: [ProductCartCard()]),
    );
  }
}
