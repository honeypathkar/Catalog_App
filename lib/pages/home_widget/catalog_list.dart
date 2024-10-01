import 'package:flutter/material.dart';
import 'package:shopping_cart/models/catalog.dart';
import 'package:shopping_cart/pages/home_page_detail.dart';
import 'package:shopping_cart/pages/home_widget/catalog_item.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModels.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModels.getByPosition(index);
        return InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog),
                  ),
                ),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}
