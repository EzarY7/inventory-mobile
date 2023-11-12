import 'package:flutter/material.dart';
import 'package:inventory/widgets/left_drawer.dart'; // import drawer widget
import 'package:inventory/screens/itemlist_form.dart';
import 'package:inventory/widgets/inv_card.dart';
class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
  appBar: AppBar(
    title: const Text(
      'Inventory',
    ),
  ),
  drawer: const LeftDrawer(), // Add drawer as parameter of the Scaffold widget
  body: SingleChildScrollView(
    // Scrolling wrapper widget
    child: Padding(
      padding: const EdgeInsets.all(10.0), // Set padding for the page
      child: Column(
        // Widget to display children vertically
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            // Text widget to display text with center alignment and appropriate style
            child: Text(
              'Inventory', // Text indicating the shop name
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Grid layout
          GridView.count(
            // Container for our cards.
            primary: true,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            shrinkWrap: true,
            children: items.map((Item item) {
              // Iteration for each item
              return InvCard(item);
            }).toList(),
          ),
        ],
      ),
    ),
  ),
);
}
}

final List<Item> items = [
    Item("View Items", Icons.checklist, Colors.indigo),
    Item("Add Item", Icons.add_shopping_cart, Colors.blue),
    Item("Logout", Icons.logout, Colors.blueGrey),
];