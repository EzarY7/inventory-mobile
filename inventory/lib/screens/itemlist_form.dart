import 'package:flutter/material.dart';
import 'package:inventory/widgets/left_drawer.dart'; 

class ItemFormPage extends StatefulWidget {
    const ItemFormPage({super.key});

    @override
    State<ItemFormPage> createState() => _ItemFormPageState();
}

class _ItemFormPageState extends State<ItemFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _amount = 0;
    String _description = "";
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Center(
                child: Text(
                    'Add Item Form',
                ),
                ),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
            ),
            // Add drawer as parameter of the Scaffold widget
            drawer: const LeftDrawer(),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                decoration: InputDecoration(
                                hintText: "Item Name",
                                labelText: "Item Name",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                ),
                                ),
                                onChanged: (String? value) {
                                setState(() {
                                    _name = value!;
                                });
                                },
                                validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                    return "Name cannot be empty!";
                                }
                                return null;
                                },
                                ),
                            ),
                            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                hintText: "Amount",
                                labelText: "Amount",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                ),
                                ),
                                onChanged: (String? value) {
                                setState(() {
                                    _amount = int.parse(value!);
                                });
                                },
                                validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                    return "Amount cannot be empty!";
                                }
                                if (int.tryParse(value) == null) {
                                    return "Amount must be a number!";
                                }
                                return null;
                                },
                            ),
                            ),
                            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                hintText: "Description",
                                labelText: "Description",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                ),
                                ),
                                onChanged: (String? value) {
                                setState(() {
                                    _description = value!;
                                });
                                },
                                validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                    return "Description cannot be empty!";
                                }
                                return null;
                                },
                            ),
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                    style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.indigo),
                                    ),
                                    onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                            return AlertDialog(
                                                title: const Text('Product successfully saved'),
                                                content: SingleChildScrollView(
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                    Text('Name: $_name'),
                                                    Text('Amount: $_amount'),
                                                    Text('Description: $_description'),
                                                    ],
                                                ),
                                                ),
                                                actions: [
                                                TextButton(
                                                    child: const Text('OK'),
                                                    onPressed: () {
                                                    Navigator.pop(context);
                                                    },
                                                ),
                                                ],
                                            );
                                            },
                                        );
                                        // itemObjects.add(ItemObject(_name,_amount,_description));
                                        _formKey.currentState!.reset();
                                        }
                                    },
                                    child: const Text(
                                        "Save",
                                        style: TextStyle(color: Colors.white),
                                    ),
                                    ),
                                ),
                            ),
                        ]
                    
                ),
            ),
            ),
        );
    }
}

// final List<ItemObject> itemObjects = [];

// class ItemObject {
//   final String name;
//   final int amount;
//   final String description;

//   ItemObject(this.name, this.amount, this.description);
// }