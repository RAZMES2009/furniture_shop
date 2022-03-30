import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/products.dart';
import './screens/main_about_shop_screen.dart';
import './screens/main_shop_screen.dart';
import './screens/detail_product_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Products()),
        // ChangeNotifierProvider(create: (_) => Product()),
      ],
      child: const FurnitureShopApp(),
    ),
  );
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
          background: const Color.fromARGB(255, 233, 228, 220),
        ),
        fontFamily: 'OldStandartTT',
      ),
      routes: {
        '/': (ctx) => const MainAboutShopScreen(),
        MainShopScreen.routeName: (ctx) => const MainShopScreen(),
        DetailProductScreen.routeName: (ctx) => const DetailProductScreen(),
      },
    );
  }
}
