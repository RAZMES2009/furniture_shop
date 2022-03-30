import 'package:flutter/material.dart';

import '../providers/product.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({
    Key? key,
    required this.currentProduct,
  }) : super(key: key);

  final Iterable<Product> currentProduct;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 35),
            child: Text(
              currentProduct.single.name!,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Image.asset(
              currentProduct.single.imgPath!,
            ),
          ),
          SizedBox(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 35),
              child: Text(
                '${currentProduct.single.name}, ${currentProduct.single.color}',
                style: const TextStyle(fontSize: 22),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 20,
                  ),
                  Text(
                    currentProduct.single.grade.toString(),
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                    width: 20,
                  ),
                  Text(
                    '${currentProduct.single.reviews} reviews',
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const BottomCardDetailScreen(),
        ],
      ),
    );
  }
}

class BottomCardDetailScreen extends StatelessWidget {
  const BottomCardDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 380,
        height: 160,
        child: Card(
          color: Theme.of(context).colorScheme.background,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Offers',
                  style: TextStyle(fontSize: 23),
                ),
                Divider(endIndent: 20),
                Text(
                  'Citibank Offer',
                  style: TextStyle(fontSize: 19),
                ),
                Text(
                  'Get additional 15% instant discount upto \$10 maximum on selected products',
                  style: TextStyle(fontSize: 19, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
