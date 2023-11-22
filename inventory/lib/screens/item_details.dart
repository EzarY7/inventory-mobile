import 'package:flutter/material.dart';
import 'package:inventory/widgets/left_drawer.dart';
import 'package:inventory/models/item.dart';

class ItemPage extends StatelessWidget {
  final Item item;

  const ItemPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text('Name: ${item.fields.name}'),
            SizedBox(height: 8),
            Text('Amount: ${item.fields.amount}'),
            SizedBox(height: 8),
            Text('Description: ${item.fields.description}'),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}