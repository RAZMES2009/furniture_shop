import 'package:flutter/material.dart';

import '../widgets/favorite_viewed.dart';
import '../widgets/new_arrivals.dart';
import '../widgets/hot_deals_cards.dart';

class MainShopScreen extends StatelessWidget {
  static const routeName = '/main-screen-shop';

  const MainShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const Drawer(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HotDealsCard(),
            NewArrivals(),
          ],
        ),
      ),
    );
  }
}
