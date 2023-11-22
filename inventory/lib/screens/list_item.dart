import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:inventory/models/item.dart';
import 'package:inventory/screens/item_details.dart';
import 'package:inventory/widgets/left_drawer.dart';

class ListItemPage extends StatefulWidget {
    const ListItemPage({Key? key}) : super(key: key);

    @override
    _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ListItemPage> {
Future<List<Item>> fetchItem() async {
    var url = Uri.parse(
        'http://127.0.0.1:8000/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // decode the response to JSON
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // convert the JSON to Product object
    List<Item> list_item = [];
    for (var d in data) {
        if (d != null) {
            list_item.add(Item.fromJson(d));
        }
    }
    return list_item;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Item'),
        ),
        drawer: const LeftDrawer(),
        
        body: FutureBuilder(
          
            future: fetchItem(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "No item data available.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return GridView.builder(
                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // Number of columns
                        crossAxisSpacing: 10.0, // Spacing between columns
                        mainAxisSpacing: 10.0, // Spacing between rows
                        childAspectRatio: 16/9, // Aspect ratio (width/height) of each item
                      ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Material(
                          color: Color.fromARGB(255, 198, 199, 207),
                          child: InkWell(
                          onTap: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ItemPage(item: snapshot.data![index]),
                              ),
                            );
                          },
                                child: Container(
                                height: 10,
                                width: 150,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.amount}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.description}")
                                ],
                                ),
                            )
                        )
                    )
                    
                            );
                    }
                }
            }));
    }
}
