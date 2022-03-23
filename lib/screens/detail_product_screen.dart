import 'package:flutter/material.dart';
import 'package:furniture_shop/models/products.dart';
import 'package:provider/provider.dart';

class DetailProductScreen extends StatelessWidget {
  static const routeName = '/detail-product';

  const DetailProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = context.watch<Products>();
    final idProduct = ModalRoute.of(context)!.settings.arguments;
    final currentProduct = productData.items.where((el) => el.id == idProduct);

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline),
            ),
          ],
        ),
        body: Container(
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.primary),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  currentProduct.single.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Image.asset(currentProduct.single.imgPath),
              ),
              Text(
                  '${currentProduct.single.name}, ${currentProduct.single.color}')
            ],
          ),
        ));
  }
}
