import 'package:flutter/material.dart';
import 'package:inventory/widgets/left_drawer.dart';
import 'package:inventory/screens/itemlist_form.dart';



class ItemListPage extends StatefulWidget {
    const ItemListPage({super.key});

    @override
    State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
                title: const Center(
                child: Text(
                    'Item List Page',
                ),
                ),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
            ),
            // Add drawer as parameter of the Scaffold widget
        drawer: const LeftDrawer(),
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
              "Take a look at the items you've saved so far!", // Text at the top of the page
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
            children: itemObjects.map((ItemObject item) { // Items from the itemObjects list.
              // Iteration for each item
              return ViewItem(item);
            }).toList(),
          ),
        ],
      ),
    ),
  ),
        );
}
}

class ViewItem extends StatelessWidget {
  final ItemObject item;

  const ViewItem(this.item, {Key? key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: InkWell(
        child: Container(
          // Container to hold item objects from the model.
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.all(7)),
                Text(
                  "Name: ${item.name}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  "Amount: ${item.amount.toString()}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  "Description: ${item.description}",
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