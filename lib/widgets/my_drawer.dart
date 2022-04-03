import 'package:flutter/material.dart';

import '../screens/favorite_item_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: SafeArea(
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'My orders',
                style: TextStyle(color: Colors.black, fontSize: 28),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Cart',
                style: TextStyle(color: Colors.black, fontSize: 28),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context)
                  .pushReplacementNamed(FavoriteItemScreen.routeName),
              child: const Text(
                'Favorite',
                style: TextStyle(color: Colors.black, fontSize: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
