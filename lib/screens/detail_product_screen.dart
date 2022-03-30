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
  @override
  Widget build(BuildContext context) {
    final productsData = context.watch<Products>();
    // final productData = Provider.of<Product>(context, listen: false);
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
                currentProduct.single.isFavorited = !currentProduct.single.isFavorited;
                print(currentProduct.single.id);
                print(currentProduct.single.isFavorited);
              });
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
    );
  }
}
