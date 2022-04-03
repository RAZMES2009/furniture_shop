import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_product.dart';
import '../providers/products.dart';

class BuildCartCards extends StatefulWidget {
  const BuildCartCards({Key? key}) : super(key: key);

  @override
  State<BuildCartCards> createState() => _BuildCartCardsState();
}

class _BuildCartCardsState extends State<BuildCartCards> {
  @override
  Widget build(BuildContext context) {
    final cartItem = context.watch<Cart>();
    final prodData = context.watch<Products>();
    final prodItems = prodData.items;
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: mediaQuery.size.width * 0.9,
                height: mediaQuery.size.height,
                child: ListView.builder(
                  itemCount: cartItem.items.length,
                  itemBuilder: (BuildContext ctx, int i) => cartItem
                          .items.isNotEmpty
                      ? SizedBox(
                          width: double.infinity,
                          height: mediaQuery.size.height * 0.2,
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
                                    child: Image.asset(cartItem
                                        .items['${prodItems[i].id}']!.imgPath
                                        .toString()),
                                  ),
                                ),
                                SizedBox(
                                  width: mediaQuery.size.width * 0.4,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cartItem
                                            .items['${prodItems[i].id}']!.name
                                            .toString(),
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        'Total amount: \$${cartItem.items['${prodItems[i].id}']!.totalAmount}',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(63, 105, 0, 1),
                                        ),
                                      ),
                                      Text(
                                        'Quantity: ${cartItem.items['${prodItems[i].id}']!.quantity}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: mediaQuery.size.width * 0.4,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: const Text('Order!'),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete),
                                  iconSize: 23,
                                  color: Colors.grey,
                                ),
                              ],
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
    );
  }
}
