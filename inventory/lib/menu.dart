import 'package:flutter/material.dart';

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
              return Card(item);
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

class Item {
  final String name;
  final IconData icon;
  final MaterialColor color;

  Item(this.name, this.icon, this.color);
}

class Card extends StatelessWidget {
  final Item item;

  const Card(this.item, {Key? key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Responsive touch area
        onTap: () {
          // Show a SnackBar when clicked
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You pressed the ${item.name} button!")));
        },
        child: Container(
          // Container to hold Icon and Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}