import 'package:flutter/material.dart';
import 'package:shopping_cart/models/catalog.dart';
import 'package:shopping_cart/widgets/item_widget.dart';
import 'package:shopping_cart/widgets/myDrawer.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  final dummyList = List.generate(20, (index) => CatalogModels.items[0]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog App",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: dummyList[index],
              );
            }),
      ),
      endDrawer: const Mydrawer(),
    );
  }
}
