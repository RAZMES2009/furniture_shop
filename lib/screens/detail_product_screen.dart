import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/detail_product.dart';

class DetailProductScreen extends StatefulWidget {
  static const routeName = '/detail-product';

  const DetailProductScreen({Key? key}) : super(key: key);

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  SnackBar showSnackBarFavorite(
      BuildContext context, Products productsData, String id) {
    return SnackBar(
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        textColor: Theme.of(context).colorScheme.error,
        disabledTextColor: Theme.of(context).colorScheme.error,
        label: 'Undo',
        onPressed: () {
          setState(() {
            productsData.items.firstWhere((el) => el.id == id).isFavorited =
                !productsData.items.firstWhere((el) => el.id == id).isFavorited;
          });
        },
      ),
      content: const Text('Added to favorite!'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productsData = context.watch<Products>();
    final idProduct = ModalRoute.of(context)!.settings.arguments;
    final currentProduct = productsData.items.where((el) => el.id == idProduct);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_rounded),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                currentProduct.single.isFavorited =
                    !currentProduct.single.isFavorited;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                showSnackBarFavorite(
                    context, productsData, currentProduct.single.id!),
              );
            },
            icon: currentProduct.single.isFavorited
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(Icons.favorite_outline),
          ),
        ],
      ),
      body: DetailProduct(currentProduct: currentProduct),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              const Icon(Icons.shopping_cart_outlined),
              Text(
                currentProduct.single.price.toString(),
                style: const TextStyle(
                  color: Color.fromRGBO(63, 105, 0, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Add to cart'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
