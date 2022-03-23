import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/products.dart';
import './screens/main_about_shop_screen.dart';
import './screens/main_shop_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Products()),
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
      },
    );
  }
}
