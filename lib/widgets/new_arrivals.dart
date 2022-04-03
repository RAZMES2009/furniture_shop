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
  SnackBar showSnackBarFavorite(
      BuildContext context, Products productsData, int i) {
    bool isFavorite = productsData.items[i].isFavorited;
    return SnackBar(
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        textColor: Theme.of(context).colorScheme.error,
        disabledTextColor: Theme.of(context).colorScheme.error,
        label: 'Undo',
        onPressed: () {
          setState(() {
            productsData.items[i].isFavorited =
                !productsData.items[i].isFavorited;
          });
        },
      ),
      content: isFavorite
          ? const Text('Added to favorite!')
          : const Text('Delete from favorite!'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final productsData = context.watch<Products>();

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'New arrivals',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
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
                        .then((_) {
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
                                width: mediaQuery.size.width * 0.5,
                                child:
                                    Image.asset(productsData.items[i].imgPath!),
                              ),
                              IconButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  setState(() {
                                    productsData.items[i].isFavorited =
                                        !productsData.items[i].isFavorited;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    showSnackBarFavorite(
                                        context, productsData, i),
                                  );
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
          ],
        ),
      ),
    );
  }
}
