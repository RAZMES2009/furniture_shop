import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/detail_product_screen.dart';
import '../providers/products.dart';

class FavoriteItemScreen extends StatelessWidget {
  static const routeName = '/favorite-item-screen';

  const FavoriteItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = context.watch<Products>();
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Favorite',
          style: TextStyle(color: Colors.black, fontSize: 28),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: mediaQuery.size.width * 0.9,
                    height: mediaQuery.size.height,
                    child: ListView.builder(
                      itemCount: productsData.items.length,
                      itemBuilder: (BuildContext ctx, int i) => productsData
                              .items[i].isFavorited
                          ? GestureDetector(
                              onTap: () => Navigator.of(context).pushNamed(
                                DetailProductScreen.routeName,
                                arguments: productsData.items[i].id,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: mediaQuery.size.height * 0.13,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Card(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: SizedBox(
                                          width: mediaQuery.size.width * 0.25,
                                          height: mediaQuery.size.height * 0.1,
                                          child: Image.asset(
                                              productsData.items[i].imgPath!),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            productsData.items[i].name!,
                                            style:
                                                const TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            '\$${productsData.items[i].price}'
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(63, 105, 0, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.shopping_cart_outlined),
                                        iconSize: 32,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
