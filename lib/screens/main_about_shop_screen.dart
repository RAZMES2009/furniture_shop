import 'package:flutter/material.dart';

import './main_shop_screen.dart';

class MainAboutShopScreen extends StatelessWidget {
  const MainAboutShopScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(207, 198, 183, 1),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 35.0, left: 10.0),
              child: Text(
                'Elegant simple Furnitures.',
                style: TextStyle(
                  fontSize: 65,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
                width: mediaQuery.size.width * 0.5,
                height: mediaQuery.size.height * 0.45,
                child: Image.asset('assets/img/main_char.png')),
            SizedBox(
              height: mediaQuery.size.height * 0.18,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Affordable home furniture designs & ideas.',
                      style: TextStyle(fontSize: 20),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pushReplacementNamed(context, MainShopScreen.routeName),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(
                            mediaQuery.size.width * 0.6,
                            mediaQuery.size.height * 0.06)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                      ),
                      child: const Text(
                        'Shopping now!',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
