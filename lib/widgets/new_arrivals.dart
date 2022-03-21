import 'package:flutter/material.dart';

import '../models/product.dart';

class NewArrivals extends StatelessWidget {
  const NewArrivals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                height: 360,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _list_products.length,
                  itemBuilder: (BuildContext ctx, int i) => SizedBox(
                    width: 310,
                    height: 350,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      color: const Color.fromRGBO(208, 190, 162, 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(_list_products[i].imgPath),
                              IconButton(
                                  onPressed: () {},
                                  icon:
                                      const Icon(Icons.favorite_outline_sharp))
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _list_products[i].name,
                                  style: const TextStyle(fontSize: 24),
                                ),
                                Text(
                                  _list_products[i].price.toString(),
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(63, 105, 0, 1)),
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
