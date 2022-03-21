import 'package:flutter/material.dart';

class HotDealsCard extends StatelessWidget {
  const HotDealsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: Text(
              'Hot deals',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.96,
              child: Card(
                color: const Color.fromRGBO(208, 190, 162, 1),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Image.asset('assets/img/image1.png'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'UPTO 75%',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Column(
                              children: const [
                                Text(
                                  'DISCOUNT',
                                  style:
                                      TextStyle(fontSize: 16, letterSpacing: 1),
                                ),
                                Text(
                                  'D.I.Y',
                                  style: TextStyle(
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'STARTS',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  'MIDNIGHT',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  '16 MARCH',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
