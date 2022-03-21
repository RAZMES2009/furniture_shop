import 'package:flutter/material.dart';

import './screens/main_about_shop_screen.dart';
import './screens/main_shop_screen.dart';

void main() {
  runApp(const FurnitureShopApp());
}

class FurnitureShopApp extends StatelessWidget {
  const FurnitureShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromRGBO(207, 198, 183, 1),
          secondary: const Color.fromRGBO(255, 255, 255, 0.4),
        ),
        fontFamily: 'OldStandartTT',
      ),
      routes: {
        '/': (ctx) => const MainAboutShopScreen(),
        MainShopScreen.routeName: (ctx) => const MainShopScreen(),
      },
    );
  }
}
