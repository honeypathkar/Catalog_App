import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:shopping_cart/models/catalog.dart';
import 'package:shopping_cart/widgets/myDrawer.dart';
// ignore: unused_import
import 'package:shopping_cart/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    // ignore: avoid_print
    print(catalogJson);
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModels.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // ignore: unnecessary_null_comparison
        child: (CatalogModels.items != null && CatalogModels.items!.isNotEmpty)
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final item = CatalogModels.items![index];
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                        header: Container(
                          // ignore: sort_child_properties_last
                          child: Text(
                            item.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Colors.deepPurple,
                          ),
                        ),
                        // ignore: sort_child_properties_last
                        child: Image.network(
                          item.image,
                        ),
                        footer: Container(
                          // ignore: sort_child_properties_last
                          child: Text(
                            item.price.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Colors.black,
                          ),
                        ),
                      ));
                },
                itemCount: CatalogModels.items!.length,
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const Mydrawer(),
    );
  }
}
