import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../screens/detail_product_screen.dart';

class NewArrivals extends StatefulWidget {
  const NewArrivals({Key? key}) : super(key: key);

  @override
  State<NewArrivals> createState() => _NewArrivalsState();
}

class _NewArrivalsState extends State<NewArrivals> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    // final productData = Provider.of<Product>(context, listen: false);
    final productsData = context.watch<Products>();

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
                'New arrivals',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SizedBox(
                width: double.infinity,
                height: mediaQuery.size.height * 0.4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productsData.items.length,
                  itemBuilder: (BuildContext ctx, int i) => SizedBox(
                    width: mediaQuery.size.width * 0.79,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(DetailProductScreen.routeName,
                              arguments: productsData.items[i].id)
                          .then((value) {
                        setState(() {
                          productsData.items[i].isFavorited;
                        });
                      }),
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        color: Theme.of(context).colorScheme.background,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Image.asset(
                                      productsData.items[i].imgPath!),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      productsData.items[i].isFavorited =
                                          !productsData.items[i].isFavorited;
                                      print(productsData.items[i].id);
                                      print(productsData.items[i].isFavorited);
                                    });
                                  },
                                  icon: productsData.items[i].isFavorited
                                      ? const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                      : const Icon(Icons.favorite_outline),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    productsData.items[i].name!,
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    '\$${productsData.items[i].price.toString()}',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(63, 105, 0, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
