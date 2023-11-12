import 'package:flutter/material.dart';
import 'package:inventory/screens/itemlist_form.dart';
import 'package:inventory/screens/itemlist.dart';
class Item {
  final String name;
  final IconData icon;
  final MaterialColor color;

  Item(this.name, this.icon, this.color);
}

class InvCard extends StatelessWidget {
  final Item item;

  const InvCard(this.item, {Key? key}); // Constructor

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
        // Navigate to the appropriate route (depending on the button type)
        if (item.name == "Add Item") {
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(
          builder: (context) => const ItemFormPage(),
          ));
        }
        if (item.name == "View Items") {
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(
          builder: (context) => const ItemListPage(),
          ));
        }
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