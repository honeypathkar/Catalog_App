import 'package:flutter/material.dart';
import 'package:shopping_cart/models/catalog.dart';
import 'package:shopping_cart/pages/home_widget/catalog_image.dart';
import 'package:shopping_cart/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'add_to_cart.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              catalog.desc.text
                  .textStyle(Theme.of(context).textTheme.bodySmall!)
                  .make(),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog.price}".text.bold.lg.make(),
                  AddToCart(
                    catalog: catalog,
                  ),
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}
