import 'package:flutter/cupertino.dart';

import './product.dart';

class Products with ChangeNotifier {
  final List<Product> _list_products = [
    Product(
      id: 'p1',
      imgPath: 'assets/img/carousel_img.png',
      name: 'Leatherette sofa',
      color: 'Yellow/Kabusa dark Green',
      description:
          'Get additional 15% instant discount upto \$10 maximum on selected products',
      price: 15.99,
      isFavorited: false,
      isRecentlyViewed: false,
    ),
    Product(
      id: 'p2',
      imgPath: 'assets/img/carousel_img2.png',
      name: 'Ork Stool',
      color: 'Pink/Kabusa dark Green',
      description:
          'Get additional 15% instant discount upto \$10 maximum on selected products',
      price: 9.99,
      isFavorited: false,
      isRecentlyViewed: false,
    ),
    Product(
      id: 'p3',
      imgPath: 'assets/img/palm_sofa.png',
      name: 'Royal Palm Sofa',
      color: 'Vissle dark Blue/Kabusa dark Navy',
      description:
          'Get additional 15% instant discount upto \$10 maximum on selected products',
      price: 18.99,
      isFavorited: false,
      isRecentlyViewed: false,
    ),
  ];

  List<Product> get items {
    return [..._list_products];
  }
}
