import 'package:flutter/material.dart';

import '../widgets/build_cart_cards.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black, fontSize: 28),
        ),
      ),
      body: const BuildCartCards(),
    );
  }
}
