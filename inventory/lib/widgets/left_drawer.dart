import 'package:flutter/material.dart';
import 'package:inventory/screens/menu.dart';
import 'package:inventory/screens/itemlist_form.dart';
import 'package:inventory/screens/itemlist.dart';


class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
  decoration: BoxDecoration(
    color: Colors.indigo,
  ),
  child: Column(
    children: [
      Text(
        'Inventory',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Padding(padding: EdgeInsets.all(10)),
      Text("View your collection of items here!",
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.white
              ),

          ),
    ],
  ),
),
ListTile(
  leading: const Icon(Icons.home_outlined),
  title: const Text('Home Page'),
  // redirect to MyHomePage
  onTap: () {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ));
  },
),
ListTile(
  leading: const Icon(Icons.add_shopping_cart),
  title: const Text('Add Item'),
  // redirect to ShopFormPage
  onTap: () {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ItemFormPage(),
        ));
  },
),
ListTile(
  leading: const Icon(Icons.checklist),
  title: const Text('View Items'),
  // redirect to ShopFormPage
  onTap: () {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ItemListPage(),
        ));
  },
),
        ],
      ),
    );
  }
}