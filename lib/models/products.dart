import 'package:flutter/cupertino.dart';

import './product.dart';

class Products with ChangeNotifier {
  final List<Product> _list_products = [
    Product(
      id: 'p1',
      imgPath: 'assets/img/carousel_img.png',
      name: 'Leatherette sofa',
      description:
          'Get additional 15% instant discount upto \$10 maximum on selected products',
      price: 15.99,
    ),
    Product(
      id: 'p2',
      imgPath: 'assets/img/carousel_img2.png',
      name: 'Ork Stool',
      description:
          'Get additional 15% instant discount upto \$10 maximum on selected products',
      price: 9.99,
    ),
  ];

  List<Product> get items {
    return [..._list_products];
  }
 
}
