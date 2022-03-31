import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class FavoriteViewed extends StatefulWidget {
  const FavoriteViewed({Key? key}) : super(key: key);

  @override
  State<FavoriteViewed> createState() => _FavoriteViewedState();
}

class _FavoriteViewedState extends State<FavoriteViewed> {
  @override
  Widget build(BuildContext context) {
    final productsData = context.watch<Products>();
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              child: Text(
                'Favorite viewed',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: SizedBox(
                width: mediaQuery.size.width * 0.9,
                height: 110,
                child: ListView.builder(
                  itemCount: productsData.items.length,
                  itemBuilder: (BuildContext ctx, int i) => productsData
                          .items[i].isFavorited
                      ? SizedBox(
                          width: double.infinity,
                          height: mediaQuery.size.height * 0.13,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Theme.of(context).colorScheme.background,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
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
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      productsData.items[i].price!.toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(63, 105, 0, 1),
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon:
                                      const Icon(Icons.shopping_cart_outlined),
                                  iconSize: 32,
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),
              ),
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
